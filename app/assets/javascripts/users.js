/* global $, Stripe */
//JQuery document ready function
$(document).on('turbolinks:load', function(){
  var premiumForm = $('#premium_form');
  var submitBtn = $('#premium-signup-btn');
  
  //Set Stripe public API key
  Stripe.setPublishableKey($('meta[name="stripe-public-key"]').attr('content'));
  
  //Prevent form submission
  submitBtn.click(function(e){
  e.preventDefault();  
  
  //Payment card collection from submission form field
  var cardNum = $('#card_number').val();
  var cvvCode = $('#card_code');
  var expMonth = $('#card_month');
  var expYear = $('#card_year');
  
  //POST card info to Stripe
  Stripe.createToken({
    number: cardNum,
    cvc: cvvCode,
    exp_month: expMonth,
    exp_year: expYear
  }, stripeResponseHandler);
  });
  
  
  
  });