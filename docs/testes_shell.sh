curl --header "Content-Type: text/xml;charset=UTF-8" --header "SOAPAction:getValor" --data @request.xml https://www3.bcb.gov.br/wssgs/services/FachadaWSSGS
curl -H "Content-Type: text/xml; charset=utf-8" -H "SOAPAction:getValor" -d @request.xml -X POST https://www3.bcb.gov.br/wssgs/services/FachadaWSSGS
