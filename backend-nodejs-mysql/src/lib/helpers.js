const bcrypt = require('bcryptjs')

const helpers = {};

// to register
helpers.encryptPassword = async(userpassword) => {
    const salt = await bcrypt.genSalt(10);
    const hash = await bcrypt.hash(userpassword, salt)
    return hash
};

// to login
helpers.matchPassword = async(userpassword, savedPassword) => {
    try {
        return await bcrypt.compare(userpassword, savedPassword)
    } catch (e) {
        console.log(e)
    }

}

module.exports = helpers;