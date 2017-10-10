<?php namespace App\Models;

/**
 * created by Lucas Di Cunzolo
 */

class User extends \App\Model
{
    protected static $table = [
        "name" => "usuarios",
        "idColumn" => "id"
    ];

    protected static $columnData = [
        "id" => "id",
        "email" => "email",
        "name" => "username",
        "firstName" => "first_name",
        "lastName" => "last_name",
        "password" => "password",
        "active" => "activo",
        "createdAt" => "created_at",
        "updatedAt" => "updated_at",
        "session" => "session"
    ];

    public static function create($data = [])
    {
        if (count(static::findBy($data['name'], 'name')) > 0) {
            throw new \Exception("El nombre de usuario ingresado corresponde a otro usuario.");
        } elseif (count(static::findBy($data['email'], 'email')) > 0) {
            throw new \Exception("El email ingresado corresponde a otro usuario.");
        }

        $data = array_merge($data, [
          "active" => "1",
          "createdAt" => date("Y-m-d H:i:s"),
          "updatedAt" => date("Y-m-d H:i:s")
        ]);

        return parent::create($data);
    }

    public function remove()
    {
        $this->addState([
          "active" => "0"
        ]);

        $this->edit();
    }

    public function roles()
    {
        $select = "*";
        $from = "usuario_tiene_roles";
        $where = "usuario_id=" . $this->id();
        $userRoles = static::$db->select($select, $from, $where);

        Role::init();

        return array_map(function ($userRole) {
            return Role::find($userRole['rol_id']);
        }, $userRoles);
    }

    public function permissions()
    {
        $roles = $this->roles();

        $permissions = [];

        $array_search = function ($permission, $permissions) {
            foreach ($permissions as $key => $permission) {
                if ($permission->equals($permission)) {
                    return true;
                }
            }

            return false;
        };

        foreach ($roles as $key => $role) {
            $rolePermissions = array_filter($role->permissions(), function ($permission) use ($permissions, $array_search) {
                return !$array_search($permission, $permissions);
            });

            foreach ($rolePermissions as $key => $value) {
                $permission[] = $value;
            }
        }

        return array_values($permissions);
    }

    public function fullName()
    {
        return "{$this->firstName()} {$this->lastName()}";
    }
}
