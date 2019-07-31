# Payslip Reporter API

Ruby version: 2.6.3

Rails version: 5.2.3

Database: PostgreSQL


## Endpoints:

Get a list of payslips:
* Verb: GET
* Path: /api/v1/payslips
* Query params: year, month

Update tax_rate on payslips belonging to a specific year and month:
* Verb: PUT
* Path: /api/v1/payslips/update_tax_rates
* Body params: year, month, tax_rate
