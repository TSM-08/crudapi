var express = require('express');
var router = express.Router();

/**
 * Get one recored by idrec (PK)
 */
router.get('/:id', function(req, res, next) {
    res.locals.connection.query(`SELECT * from nbu_ccy where ccy_irec=${req.params.id}`, function (error, results, fields) {
      if (error) {
        res.contentType('application/json');
        res.status(422).send(JSON.stringify({"status": 422, "error": { message: error.message , errordetails: { sqlState: error.sqlState,  sqlMessage: error.sqlMessage} }, "response": null}));
      } else {
        res.contentType('application/json');
        res.send(JSON.stringify({"status": 200, "error": null, "response": results}));
      }
    });  
});

/**
 * Insert record
 */
router.post('/', function(req, res, next) {
    const {ccy_code, ccy_isoc, ccy_name}  = req.body;
    
    var lqry = `insert into nbu_ccy (ccy_code, ccy_isoc, ccy_name) values ('${ccy_code}','${ccy_isoc}', '${ccy_name}')`; 
    res.locals.connection.query(lqry, function (error, results, fields) {
      if (error) {
        res.contentType('application/json');
        res.status(422).send(JSON.stringify({"status": 422, "error": { message: error.message , errordetails: { sqlState: error.sqlState,  sqlMessage: error.sqlMessage} }, "response": null}));
      } else {
        res.contentType('application/json');
        res.send(JSON.stringify({"status": 200, "error": null, "response": results}));
      }
    });  
});

/**
 * update record
 */
router.post('/:id', function(req, res, next) {
    const {ccy_code, ccy_isoc, ccy_name}  = req.body;
   
    var lqry = `update nbu_ccy set ccy_code = '${ccy_code}', ccy_isoc = '${ccy_isoc}', ccy_name = '${ccy_name}' where ccy_irec = ${req.params.id}`; 
    res.locals.connection.query(lqry, function (error, results, fields) {
      if (error) {
        res.contentType('application/json');
        res.status(422).send(JSON.stringify({"status": 422, "error": { message: error.message , errordetails: { sqlState: error.sqlState,  sqlMessage: error.sqlMessage} }, "response": null}));
      } else {
        res.contentType('application/json');
        res.send(JSON.stringify({"status": 200, "error": null, "response": results}));
      }
    });  
});

/**
 * delete record
 */
 router.delete('/:id', function(req, res, next) {
  
  var lqry = `delete from nbu_ccy where ccy_irec = ${req.params.id}`; 
  res.locals.connection.query(lqry, function (error, results, fields) {
    if (error) {
      res.contentType('application/json');
      res.status(422).send(JSON.stringify({"status": 422, "error": { message: error.message , errordetails: { sqlState: error.sqlState,  sqlMessage: error.sqlMessage} }, "response": null}));
    } else {
      res.contentType('application/json');
      res.send(JSON.stringify({"status": 200, "error": null, "response": results}));
    }
  });  
});

module.exports = router;
