var express = require("express"),
	session = require("express-session"),
	request = require("request"),
	ejs = require("ejs"),
  bodyParser = require("body-parser"),
	lodash    = require('lodash');
	methodOverride = require("method-override"),
	db = require('./models'),
	app = express();

var env = process.env;

var yelp = require("yelp").createClient({
  consumer_key: env.YELP_C_KEY,
  consumer_secret: env.YELP_C_SECRET,
  token: env.YELP_T,
  token_secret: env.YELP_T_SECRET
});


app.set("view engine", "ejs");

app.use(session({
  secret: 'strawberries',
  resave: false,
  saveUninitialized: true
}));

app.use("/", function(req,res,next) {
  req.login = function(user) {
    req.session.userId = user.id;
  };
  req.currentUser = function() {
    return db.User.find(req.session.userId)
             .then(function(guest) {
              req.user = guest;
              return guest;
             });
  };
  req.logout = function() {
    req.session.userId = null;
    req.user = null;
  };
  next();
});

app.use(methodOverride("_method"));

app.use(bodyParser.urlencoded({extended: true}));

//for styling, add public folder with css sheets: app.use(express.static('public'));

//renders home page
app.get('/', function (req, res) {
	res.render('site/index');
});

//renders sign up page
app.get('/signup', function(req, res) {
	res.render('guests/signup');
});

//renders log in page
app.get('/login', function(req,res){
  req.currentUser().then(function(guest){
    if (guest) {
      res.redirect('/profile');
    } else {
      res.render('guests/login');
    }
  });
 }); 


//renders profile page
app.get('/profile', function (req, res) {
  req.currentUser().then(function(guest){
    if (guest) {
      console.log("hello the profile page is working");
      db.Favorite.findAll({where: {UserId: guest.id}})
        .then(function(places){
          console.log("This should be our user Id" + UserId);
      res.render('guests/profile', {user: guest, bs: places });
    });
    } else {
      res.redirect('/login');
    }
  });
});

//creates a new user
app.post('/signup', function(req,res){
  var email = req.body.email;
  var password = req.body.password;

  db.User.createSecure(email, password)
    .then(function(user){
      req.login(user);
      res.render("guests/profile", {user: user});
    });
});


//logs a user in & renders profile page
app.post('/login', function(req,res){
  var email = req.body.email;
  var password = req.body.password;
  db.User.authenticate(email,password)
    .then(function(user){
      if(user) {
        req.login(user);
        res.render('guests/profile', {user: user});
      } else {
        console.log("Nadda, no user.")
        res.redirect('/login');
      }
    }); 
});

app.get('/search', function(req, res) {
  var bsearch = req.query.q;
  if (!bsearch) {
    res.render("site/search", {businesses: []});
  } else {
  yelp.search({term: bsearch , location: "Outer Sunset, San Francisco"}, function(error, data) {
    console.log("Error: " + error);
    console.log(data);
    res.render('site/search', {businesses: data.businesses});  
  })
}
});

// app.get('/business', function(req,res){
//   req.currentUser().then(function(guest){
//     if(guest) {
//       res.render("business", {businesses: data.businesses});  
//     }
//     else {

//     }
//   });
// });

app.post('/favorites', function(req,res){
  var name =req.body.name;
  var phone = req.body.phone;
  var url = req.body.url;

  req.currentUser().then(function(guest){
    if (guest) {
      console.log("hello");
      guest.addToFavs(db, name, phone, url).then(function(business){
        res.redirect('/profile');
      });
    } else {
      res.redirect('/login');
    }
  });
});

//allows user to sign out & redirects to log in page
app.delete('/logout', function(req,res){
  req.logout();
  res.redirect('/login');
});

//renders dining page
app.get('/dining', function(req, res) {
    res.render('site/dining');
});

//renders restaurants page
app.get("/restaurants", function (req, res) {
  yelp.search({term: "restaurants", location: "Outer Sunset, San Francisco"}, function(error, data) {
    console.log("Error: " + error);
    console.log(data);
  res.render("dining/restaurants", {businesses: data.businesses});
  })
});

//renders bars page
app.get('/bars', function(req, res) {
  yelp.search({term: "bars", location: "Outer Sunset, San Francisco"}, function(error, data) {
    console.log("Error: " + error);
    console.log(data);
    res.render('dining/bars', {businesses: data.businesses});
  })
});

//renders coffee shop page
app.get('/coffeeshops', function(req, res) {
  yelp.search({term: "coffee+shops", location: "Outer Sunset, San Francisco"}, function(error, data) {
    console.log("Error: " + error);
    console.log(data);
    res.render('dining/coffeeshops', {businesses: data.businesses});
  })
});

//renders travel page
app.get('/travel', function(req, res) {
    res.render('site/travel');
});

//renders cabs page
app.get("/cabs", function (req, res) {
  yelp.search({term: "cabs", location: "Outer Sunset, San Francisco"}, function(error, data) {
    console.log("Error: " + error);
    console.log(data);
  res.render("travel/cabs", {businesses: data.businesses});
  })
});


//renders public transit page
app.get("/publictransit", function (req, res) {
  yelp.search({term: "public transportation", location: "Outer Sunset, San Francisco"}, function(error, data) {
    console.log("Error: " + error);
    console.log(data);
  res.render("travel/publictransit", {businesses: data.businesses});
  })
});

//renders biking page
app.get("/biking", function (req, res) {
  yelp.search({term: "bike+rentals", location: "Outer Sunset, San Francisco"}, function(error, data) {
    console.log("Error: " + error);
    console.log(data);
  res.render("travel/biking", {businesses: data.businesses});
  })
});

//renders activities page
app.get('/activities', function(req, res) {
    res.render('site/activities');
});

//renders kid activities page
app.get('/kids', function(req, res) {
  yelp.search({term: "kids+activities", location: "Outer Sunset, San Francisco"}, function(error, data) {
    console.log("Error: " + error);
    console.log(data);
    res.render('activities/kids', {businesses: data.businesses});
  })
});

    
//renders parks page
app.get('/parks', function(req, res) {
  yelp.search({term: "parks", location: "Outer Sunset, San Francisco"}, function(error, data) {
    console.log("Error: " + error);
    console.log(data);
    res.render('activities/parks', {businesses: data.businesses});
  })
});


//renders museums page
app.get('/museums', function(req, res) {
  yelp.search({term: "museums", location: "Outer Sunset, San Francisco"}, function(error, data) {
    console.log("Error: " + error);
    console.log(data);
    res.render('activities/museums', {businesses: data.businesses});
  })
});



app.get('/sync', function(req, res) {
  // Be careful, deletes all data in your database
  db.sequelize.sync({force: true}).then(function() {
    res.send("Database sync successful!");
  })
})

app.listen(process.env.PORT || 3000, function() {
    console.log("Hello there, I'm listening");
});)




