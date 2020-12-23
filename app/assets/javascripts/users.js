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
  submitBtn.val("Processing...").prop('disabled', true);
  
  //Payment card collection from submission form field
  var cardNum = $('#card_number').val();
  var cvvCode = $('#card_code').val();
  var expMonth = $('#card_month').val();
  var expYear = $('#card_year').val();
  
  //Stripe js library validation
  var error = false;
  
  if(!Stripe.card.validateCardNumber(cardNum)){
    error = true;
    alert('Invalid Card Number!');
  }
  // CVV/CVC Number validation
  if(!Stripe.card.validateCVC(cvvCode)){
    error = true;
    alert('Invalid CVC/CVV Number!');
  }
  
  if(!Stripe.card.validateExpiry(expMonth, expYear)){
    error = true;
    alert('Invalid Expiry Date!');
  }
  
  if (error){
    //Re-enable submit button
    submitBtn.prop('disabled', false).val("Sign Up");
  }
  else
  {
  //POST card info to Stripe
    Stripe.createToken({
      number: cardNum,
      cvc: cvvCode,
      exp_month: expMonth,
      exp_year: expYear
    }, stripeResponseHandler);
  }
  return false;
  });
  //Process Stripe token
  function stripeResponseHandler(status, response){
    var stripeToken = response.id;
    
    premiumForm.append($('<input type="hidden" name="user[stripe_card_token]">').val(stripeToken));
    //Send new signup info to rails database
    premiumForm.get(0).submit();
  }
});