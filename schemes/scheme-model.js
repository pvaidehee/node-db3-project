const db = require('../data/db-config'); 

module.exports = {
    find,
    findById,
    findSteps,
    add, 
    update, 
    remove,
    addStep
}; 

function find() {
    return db('schemes'); 
}; 

function findById(id) {
    return db('schemes')
            .where({ id })
            .first();
};

function findSteps(id) {
    return db('schemes')
            .join('steps', 'schemes.id', 'steps.scheme_id')
            .select('schemes.scheme_name', 'steps.step_number', 'steps.instructions')
            .where({ scheme_id: id })
            .orderBy('steps.step_number');
};

function add(scheme) {
    return db('schemes')
            .insert(scheme, 'id')
            .then(([id]) => {
                return findById(id);
            })
            .catch(err => {
                console.log(err)
            });
};

function update(changes, id) {
    return db('schemes')
            .where({ id })
            .update(changes)
            .then(() => {
                return findById(id);
            })
            .catch(err => {
                console.log(err); 
            });
};

function remove(id) {
    return db('schemes')
            .where({ id })
            .del();
};

function addStep(step, schemeId) {
    step.scheme_id = schemeId;
    return db('steps')
      .insert(step, 'id')
      .then(ids => {
        const [ id ] = ids;
        return db('steps')
          .where({ id })
          .first();
      });
  }