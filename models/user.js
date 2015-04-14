'use strict';
var bcrypt = require("bcrypt");
var salt = bcrypt.genSaltSync(10);

module.exports = function (sequelize, DataTypes){
  var User = sequelize.define('User', {
    firstName: DataTypes.STRING,
    email: { 
      type: DataTypes.STRING, 
      unique: true, 
      validate: {
        len: [6, 30],
      }
    },
    passwordDigest: {
      type:DataTypes.STRING,
      validate: {
        notEmpty: true
      }
    }
  },

  {
  instanceMethods: {
      checkPassword: function(password) {
        return bcrypt.compareSync(password, this.passwordDigest);
      },
      addToFavs: function(db, name, phone, url) {
        return db.Favorite
          .create({businessName: name, businessPhone: phone, businessUrl: url, userId: this.id});
      }
    },

    classMethods: {
      encryptPassword: function(password) {
        var hash = bcrypt.hashSync(password, salt);
        return hash;
      },
      createSecure: function(name, email, password) {
        if(password.length < 6) {
          throw new Error("Password too short");
        }
        return this.create({
          name: name,
          email: email,
          passwordDigest: this.encryptPassword(password)
        });

      },
      authenticate: function(email, password) {
        // find a user in the DB
        return this.find({
          where: {
            email: email
          }
        }) 
        .then(function(user){
          if (user === null){
            throw new Error("Username does not exist");
          }
          else if (user.checkPassword(password)){
            return user;
          } else {
            return false;
          }

        });
      },
      associate: function(models) {
        this.hasMany(models.Review);
        this.hasMany(models.Favorite);
      }

    } // close classMethods
  }); // close define user
  return User;
}; // close User function