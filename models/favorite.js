"use strict";
module.exports = function(sequelize, DataTypes) {
  var Favorite = sequelize.define("Favorite", {
    userId: DataTypes.INTEGER,
    businessName: DataTypes.STRING,
    businessId: DataTypes.STRING,
    businessUrl: DataTypes.STRING,
    businessPhone: DataTypes.STRING
  }, {
    classMethods: {
      associate: function(models) {
        this.belongsTo(models.User);
      }
    }
  });
  return Favorite;
};