<?php

class Log 
{
	private $handle;
	
	public function __construct($filename) {
		if (LOG) {
			$this->handle = fopen(DIR_LOG . $filename, 'a');
		}
	}
	
	public function write($message) {
		if (LOG) {
			if (!$message) return;
			fwrite($this->handle, date('Y-m-d G:i:s') . ' - ' . print_r($message, true) . "\n");
		}
	}

	public function simplyWrite($message) {
		if (LOG) {
			if (!$message) return;
			fwrite($this->handle, print_r($message, true) . "\n");
		}
	}
	
	public function __destruct() {
		if (LOG) {
			fclose($this->handle);
		}
	}
}