
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


## API

### shortcode.add(name, callback)
Adds a shortcode handler to name with signature [buf, options]


### shortcode.remove(name)

Removes a shortcode handler.

### shortcode.parse(str, context)
Parses shortcodes with optional context. Built-in context is used if no content is specified.



## License

`shortcode-parser` is [MIT Licensed](https://github.com/derdesign/shortcode-parser/blob/master/LICENSE)