<?php

require DIR_VENDOR . 'mike42/escpos-php/autoload.php';

use Mike42\Escpos\Printer;
use Mike42\Escpos\EscposImage;
use Mike42\Escpos\CapabilityProfile;
use Mike42\Escpos\PrintConnectors\FilePrintConnector;
use Mike42\Escpos\PrintConnectors\WindowsPrintConnector;
use Mike42\Escpos\PrintConnectors\NetworkPrintConnector;

class Escpos
{
    public $printer;
    public $char_per_line = 42;

    public function __construct() {}

    function load($printer) {
        $this->char_per_line = $printer->char_per_line;
        if ($printer->type == 'network') {
            try {
                $connector = new NetworkPrintConnector($printer->ip_address, $printer->port);
                $this->printer = new Printer($connector);
            } catch (Exception $e) {
                echo "Couldn't print to this printer: " . $e -> getMessage() . "\n";
            }
        } elseif ($printer->type == 'linux') {
            $connector = new FilePrintConnector($printer->path);
        } else {
            $connector = new WindowsPrintConnector($printer->path);
        }
    }

    public function print_receipt($data) {

        if (isset($data->logo) && !empty($data->logo)) {
            $this->printer->setJustification(Printer::JUSTIFY_CENTER);
            $logo = EscposImage::load(FCPATH.'assets/uploads/logos/'.DIRECTORY_SEPARATOR.$data->logo, false);
            $this->printer->bitImage($logo);
        }

        $this->printer->setJustification(Printer::JUSTIFY_CENTER);
        $this->printer->setEmphasis(true);
        $this->printer->setTextSize(2, 2);
        $this->printer->text($data->text->store_name);
        $this->printer->setEmphasis(false);

        $this->printer->setTextSize(1, 1);
        $this->printer->feed();
        $this->printer->text($data->text->header);
        $this->printer->setJustification(Printer::JUSTIFY_LEFT);
        $this->printer->text($data->text->info);
        $this->printer->text($data->text->items);

        if (isset($data->text->totals) && !empty($data->text->totals)) {
            $this->printer->text(drawLine($data->printer->char_per_line));
            $this->printer->text($data->text->totals);
        }

        if (isset($data->text->payments) && !empty($data->text->payments)) {
            $this->printer->text(drawLine($data->printer->char_per_line));
            $this->printer->text($data->text->payments);
            $this->printer->feed(2);
        }

        if (isset($data->text->footer) && !empty($data->text->footer)) {
            $this->printer->setJustification(Printer::JUSTIFY_CENTER);
            $this->printer->text($data->text->footer);
        }

        $this->printer->feed(2);
        $this->printer->cut();

        if (isset($data->cash_drawer) && !empty($data->cash_drawer)) {
            $this->printer->pulse();
        }

        $this->printer->close();

    }

    function open_drawer() {
        $this->printer->pulse();
        $this->printer->close();
    }

}
