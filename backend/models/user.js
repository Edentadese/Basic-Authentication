const mongoose = require("mongoose");


const userSchema = mongoose.Schema({
  name: {
    required: true,
    type: String,
    trim: true,
  },
  email: {
    required: true,
    type: String,
    trim: true,
    validate: {
      validator: (value) => {
        const re =
          /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
        return value.match(re);
      },
      message: "Please enter a valid email address",
    },
  },
  password: {
    required: true,
    type: String,
    validate: {
        validator: (value) => {
            // Check length
            if (value.length < 6) {
                throw new Error("Password must be at least 6 characters long!");
            }

            // Check if the first letter is a capital letter
            // if (!/^[A-Z]/.test(value)) {
            //     throw new Error("First letter of the password must be a capital letter!");
            // }

            return true;
        }
    }
}
,
  address: {
    type: String,
    default: "",
  },
  type: {
    type: String,
    default: "user",
  },
  
});

const User = mongoose.model("User", userSchema);
module.exports = User;