<?php

class UpdateController extends AppController {

	public $components = array('Session', 'Update');

	public function admin_index() { // ajout d'un commentaire pour git
		if($this->isConnected AND $this->User->isAdmin()) {
			$this->set('title_for_layout',$this->Lang->get('GLOBAL__UPDATE'));
			$this->layout = 'admin';

        if(@$dir = opendir(ROOT.'/app/tmp/logs/update/')) {
          while(($file = readdir($dir)) !== false) {
            	if($file != ".." && $file != "." && $file != '.DS_Store' && $file != '__MACOSX' && $file != 'lang') {
            		$files[$file] = filemtime(ROOT.'/app/tmp/logs/update/'.$file);
            	}
        	}

				if(!empty($files)) {
        	arsort($files);
        	$files = array_keys($files);
        	$logs = array_shift($files);
        	$logs = file_get_contents(ROOT.'/app/tmp/logs/update/'.$logs);
        	$logs = json_decode($logs, true);
				} else {
					$logs = array();
				}
      } else {
      	$logs = array();
      }
			$this->set(compact('logs'));
		} else {
			$this->redirect('/');
		}
	}

	public function admin_update($componentUpdated = '0') {
		if($this->isConnected AND $this->User->isAdmin()) {
			$this->response->type('json');
			$this->autoRender = false;

			$componentUpdated = boolval($componentUpdated);
			if($this->Update->updateCMS($componentUpdated)) {
				if($componentUpdated == '1') {
					echo json_encode(array('statut' => 'success', 'msg' => $this->Lang->get('UPDATE__SUCCESS')));
				} else {
					echo json_encode(array('statut' => 'continue', 'msg' => ''));
				}
			} else {
				echo json_encode(array('statut' => 'error', 'msg' => $this->Lang->get('UPDATE__FAILED')));
			}

		} else {
			$this->redirect('/');
		}
	}

	public function admin_check() {
		unlink(ROOT.'/config/update');
		$this->redirect(array('action' => 'index'));
	}
}
