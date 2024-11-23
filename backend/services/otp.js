const TIME_INTERVAL_MIN = 1 // min

// every day 24*60/TIME_INTERVAL

const generateOtps = () => {

}

const otpGenerator = (digits) => {
    return Math.floor(Math.random() * Math.pow(10, digits))
      .toString()
      .padStart(digits, "0");
  };


const verifyOtp = () => {

}

const removeOldOtps = () => {

}