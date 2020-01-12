const ERROR_INPUT_VALIDATOR = 'Input can\'t be empty or less than 3 symbols';

String validateInput(String value) =>
    value.length < 3 ? ERROR_INPUT_VALIDATOR : null;
