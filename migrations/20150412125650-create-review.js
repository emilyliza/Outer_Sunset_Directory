"use strict";
module.exports = {
  up: function(migration, DataTypes, done) {
    migration.createTable("Reviews", {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: DataTypes.INTEGER
      },
      businessName: {
        type: DataTypes.STRING
      },
      rating: {
        type: DataTypes.STRING
      },
      review: {
        type: DataTypes.STRING
      },
      userId: {
        type: DataTypes.INTEGER
      },
      createdAt: {
        allowNull: false,
        type: DataTypes.DATE
      },
      updatedAt: {
        allowNull: false,
        type: DataTypes.DATE
      }
    }).done(done);
  },
  down: function(migration, DataTypes, done) {
    migration.dropTable("Reviews").done(done);
  }
};