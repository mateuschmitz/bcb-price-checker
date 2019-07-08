#!/bin/bash

DATE=$1
if [ -z "$DATE" ]
  then
    DATE=$(date +%d/%m/%Y)
fi

BCB_URL="https://www3.bcb.gov.br/wssgs/services/FachadaWSSGS"
BCBWSACTION="getValor"

ENVELOPE="<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:v1=\"http://schemas.conversesolutions.com/xsd/dmticta/v1\">"
ENVELOPE+="<soapenv:Header/>"
ENVELOPE+="<soapenv:Body>"
ENVELOPE+="<v1:$BCBWSACTION>"
ENVELOPE+="<v1:in0>1</v1:in0>"
ENVELOPE+="<v1:in1>$DATE</v1:in1>"
ENVELOPE+="</v1:$BCBWSACTION>"
ENVELOPE+="</soapenv:Body>"
ENVELOPE+="</soapenv:Envelope>"

RESULT=$(curl -s --header "Content-Type: text/xml;charset=UTF-8" \
     --header "SOAPAction:$BCBWSACTION" \
     -d "$ENVELOPE" \
     -X POST https://www3.bcb.gov.br/wssgs/services/FachadaWSSGS)

if [[ $RESULT =~ ([0-9]{1,2}\.[0-9]{3,5}) ]]; then
    VALUE=${BASH_REMATCH[1]}
else
    echo "Value not found to $DATE"
    exit
fi

echo "Value to $DATE is R$ $VALUE"
