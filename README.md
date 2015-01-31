
# shortcode-parser [![Build Status](https://secure.travis-ci.org/derdesign/shortcode-parser.png)](http://travis-ci.org/derdesign/shortcode-parser)

Shortcode parser written in JavaScript.


## Features

- Supports self closing and enclosing shortcodes
- Supports shortcode attributes
- Automatic typecasting to JavaScript native objects
- Clean &amp; Linted JavaScript source
- Unit tests included


## Usage

Install:
    
```shell
npm install shortcode-parser
```
    
Install from git Repository:

```shell
git clone https://github.com/derdesign/shortcode-parser.git
```
    
Running tests:

```shell
make test
```
    
Require the library:

```javascript
var shortcode = require('shortcode-parser');
```
    
Adding shortcodes:

```javascript    
shortcode.add('bold', function(buf, opts) {
  if (opts.upper) buf = buf.toUpperCase();
  return '<strong>' + buf + '</strong>';
});
```
    
Parsing shortcodes:

```javascript    
var str = "This is [bold upper=true]Bold Text[/bold]!!!";
var out = shortcode.parse(out);
```
    
Parsing shortcodes with context:

```javascript
var str = "[markdown gfm tables breaks sanitize]## Hello World[/markdown]";
var out = shortcode.parse(str, {
  charcodes: function(buf, opts) {
    return marked(buf, opts);
  }
});
```

Configuring shortcode tags:

```javascript
shortcode.setTags('{{', '}}');
```

## API

### shortcode.setTags(open, close)

Changes the shortcode open and close tags to the values passed in.

### shortcode.add(name, callback)

Adds a handler to the shortcode `name`. The handler receives `(str, params, data)`. When using an enclosing
shortcode, `str` will contain the wrapped content (empty string if it's a self closing shortcode).

The `params` object contains the parameters for to the shortcode. The `data` object is passed by `shortcode.parse()` if provided.


### shortcode.remove(name)

Removes a shortcode handler.

### shortcode.parse(str, data, context)

Performs shortcode replacements on `str`. If `context` is specified, its methods will be used as shortcode handlers instead
of the registered ones. The `data` parameter is optional and will be passed to all shortcode handlers.

### shortcode.parseInContext(str, context, data)

Same as `shortcode.parse` but with the second and third parameters swapped. Added for convenience and readability.


## License

`shortcode-parser` is [MIT Licensed](https://github.com/derdesign/shortcode-parser/blob/master/LICENSE)