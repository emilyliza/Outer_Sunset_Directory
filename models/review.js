"use strict";
module.exports = function(sequelize, DataTypes) {
  var Review = sequelize.define("Review", {
    businessName: DataTypes.STRING,
    businessId: DataTypes.STRING,
    review: DataTypes.STRING
  }, {
    classMethods: {
      associate: function(models) {
        this.belongsTo(models.User);
      }
    }
  });
  return Review;
};