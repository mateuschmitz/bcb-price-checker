# BCB Price Checker

This project allows to get currencies prices (and more) directly from [Banco Central do Brasil](https://www.bcb.gov.br). It supports only `getValor` method and, it's easy to use. [Here](https://github.com/mateuschmitz/bcb-price-checker/blob/master/docs/FachadaWSSGS.wsdl) you find the WSDL from BCB web service.

## Installation
```bash
$ git clone git@github.com:mateuschmitz/bcb-price-checker.git [PROJECT_PATH]
$ cd [PROJECT_PATH]
$ chmod +x run.sh
```

## Usage

```bash
$ ./run.sh [DATE] [SERIE]
```

The output must be:

```bash
$ Value to 08/07/2019 is R$ 3.8065
```

If the web service is down or doesn't exist a price to the **serie** requested, the output must be:

```bash
$ Value not found to '07/07/2019'
```

If you don't inform `DATE` param, It'll use the current date and, if you don't inform `SERIE`, It'll use **1**. Date must be used in `DD/MM/YYYY` format.

## Options
A complete list of all series supported by BCB web service can be found [here](https://github.com/mateuschmitz/bcb-price-checker/blob/master/docs/series.txt). Below, a list of all currencies supported:

| Serie | Description |
|-------|-------------|
|     1 | Dólar (venda) |
| 10813 | Dólar (compra) |
| 21619 | Euro (venda) |
| 21620 | Euro (compra) |
| 21621 | Iene (venda) |
| 21622 | Iene (compra) |
| 21623 | Libra esterlina (venda) |
| 21624 | Libra esterlina (compra) |
| 21625 | Franco Suíço (venda) |
| 21626 | Franco Suíço (compra) |
| 21627 | Coroa Dinamarquesa (venda) |
| 21628 | Coroa Dinamarquesa (compra) |
| 21629 | Coroa Norueguesa (venda) |
| 21630 | Coroa Norueguesa (compra) |
| 21631 | Coroa Sueca (venda) |
| 21632 | Coroa Sueca (compra) |
| 21633 | Dólar Australiano (venda) |
| 21634 | Dólar Australiano (compra) |
| 21635 | Dólar Canadense (venda) |
| 21636 | Dólar Canadense (compra) |

## License 

[MIT License](https://opensource.org/licenses/MIT)