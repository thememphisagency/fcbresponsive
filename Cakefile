{spawn, exec} = require 'child_process'

task 'build', 'Watch source files and build JS & CSS', (options) ->

  runCommand = (name, args) ->
    proc =           spawn name, args
    proc.stderr.on   'data', (buffer) -> console.log buffer.toString()
    proc.stdout.on   'data', (buffer) -> console.log buffer.toString()
    proc.on          'exit', (status) -> process.exit(1) if status != 0

  runCommand 'compass', ['watch']
  runCommand 'fuse',  ['-i', './js/fcbResponsive.js', '-o', './js/fcbResponsive.min.js', '-w']