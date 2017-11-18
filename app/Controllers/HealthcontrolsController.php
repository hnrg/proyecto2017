<?php namespace App\Controllers;

use Mbh\Collection;
use App\Models\HealthControl;
use App\Models\Patient;

/**
 * @author Ulises Jeremias Cornejo Fandos
 */
class HealthcontrolsController extends \App\Controller
{
    public function __construct($app)
    {
        parent::__construct($app, [
          'logged' => true
        ]);

        $this->app->get('/healthcontrols/show/:id', [ $this, 'show']);
        $this->app->get('/healthcontrols/create/patient/:id', [ $this, 'add']);
        $this->app->post('/healthcontrols/create', [ $this, 'createHealthControl']);
        $this->app->post('/healthcontrols/edit/:id', [ $this, 'edit']);
        $this->app->post('/healthcontrols/delete/:id', [ $this, 'delete']);

        $this->app->run();
    }

    public function show($id)
    {
        $this->checkPermissions([ 'paciente_show' ]);

        HealthControl::init();
        $healthControl = HealthControl::find($id);

        if ($healthControl) {
            return $this->template->render('healthcontrols/show.twig', [
                'healthControl' => $healthControl,
                'patient' => $healthControl->patient()
            ]);
        }

        $this->redirect("error/404");
    }

    public function add($patientId)
    {
        $this->checkPermissions([ 'paciente_new' ]);

        Patient::init();
        $patients = new Collection(Patient::get([
            "id" => $patientId,
            "state" => "1"
        ]));

        if ($patient = $patients->get(0)) {
            return $this->template->render('healthcontrols/create.twig', [
                'patient' => $patient
            ]);
        }

        $this->redirect("error/404");
    }

    public function createHealthControl()
    {
        $this->checkPermissions([ 'paciente_new' ]);

        try {
            $post = $this->post();

            HealthControl::init();
            $healthControl = HealthControl::create([
                'weight' => $post['weight'],
                'completeVaccines' => $post['completeVaccines'],
                'vaccinesObservations' => $post['vaccinesObservations'],
                'accordingMaturationContext' => $post['accordingMaturationContext'],
                'maturationObservations' => $post['maturationObservations'],
                'commonPhysicalExamination' => $post['commonPhysicalExamination'],
                'physicalExaminationObservations' => $post['physicalExaminationObservations'],
                'cephalicPercentile' => $post['cephalicPercentile'],
                'percentileCephalicPerimeter' => $post['percentileCephalicPerimeter'],
                'size' => $post['size'],
                'alimentation' => $post['alimentation'],
                'generalObservations' => $post['generalObservations'],
                'patientId' => $post['patientId'],
                'userId' => $post['userId']
            ]);

            $this->redirect("healthcontrols/show/patient/{$healthControl->patient->id()}?success=true&message=La operación fue realizada con éxito.");
        } catch (\Exception $e) {
            $this->redirect("healthcontrols/create/patient/{$post['patientId']}?success=false&message={$e->getMessage()}");
        }
    }

    public function edit($id)
    {
        $this->checkPermissions([ 'paciente_update' ]);

        try {
            $post = $this->post();

            HealthControl::init();
            $healthControl = HealthControl::find($id);

            $healthControl->addState([
                'weight' => $post['weight'],
                'completeVaccines' => $post['completeVaccines'],
                'vaccinesObservations' => $post['vaccinesObservations'],
                'accordingMaturationContext' => $post['accordingMaturationContext'],
                'maturationObservations' => $post['maturationObservations'],
                'commonPhysicalExamination' => $post['commonPhysicalExamination'],
                'physicalExaminationObservations' => $post['physicalExaminationObservations'],
                'cephalicPercentile' => $post['cephalicPercentile'],
                'percentileCephalicPerimeter' => $post['percentileCephalicPerimeter'],
                'size' => $post['size'],
                'alimentation' => $post['alimentation'],
                'generalObservations' => $post['generalObservations']
            ]);

            $healthControl->edit();

            $this->redirect("healthcontrols/show/patient/{$healthControl->patient->id()}?success=true&message=La operación fue realizada con éxito.");
        } catch (\Exception $e) {
            $this->redirect("healthcontrols/show/patient/{$post['patientId']}?success=false&message={$e->getMessage()}");
        }
    }

    public function delete($id)
    {
        try {
            $this->checkPermissions([ 'paciente_destroy' ]);

            HealthControl::init();
            $healthControl = HealthControl::find($id);

            $patientId = $healthControl->patient->id();
            $healthControl->remove();
            $this->redirect("patients/show/{$patientId}?success=true&message=La operación fue realizada con éxito.")
        } catch (\Exception $e) {
            $this->redirect("?success=false&message=Hubo un fallo en la operación.")
        }
    }
}
