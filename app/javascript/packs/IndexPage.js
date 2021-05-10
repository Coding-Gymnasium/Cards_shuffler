import $ from 'jquery';

function test(capital) {
  console.log(capital);
};

$(() =>
  $('button#test').on('click', () => test('Log this'))
  );
