<?php

ini_set("soap.wsdl_cache_enabled", "0");
header('Content-type: text/html; charset=UTF-8');

/**
 * Organiza parâmetros
 */
$dataCotacao = date('d/m/Y');
if ($_SERVER['argc'] > 1) {
    // chalaça mode: On
    $dataCotacao = (preg_match('/([0-9]{2}\/[0-9]{2}\/[0-9]{4})/', $_SERVER['argv'][1]))
        ? $_SERVER['argv'][1]
        : date('d/m/Y');
}

try {

    $conexao = new SoapClient('https://www3.bcb.gov.br/sgspub/JSP/sgsgeral/FachadaWSSGS.wsdl');
    $result = $conexao->__soapCall('getValor', array("in0" => "1", "in1" => $dataCotacao));
    echo "R$ " . number_format($result, 2, ',', '.') . "\n";

} catch (\Exception $e) {
    echo "Não foi possível recuperar a cotação na data solicitada.\n";
    echo "Erro: {$e->getMessage()}\n";
}