module Puppet::Parser::Functions
  newfunction(:annotation_guess, :type => :rvalue, :doc => <<-EOS
  Determines the location (file:line) of the declaration for the current
  resource.  Useful for creating links to documentation automaticall from
  Puppet code.

  Doesn't work with the 'include' function (e.g. include sshd) or
  resources created with create_resources.
  EOS
  ) do |args|
    scope = self
    resource = scope.resource

    if scope.resource.file and scope.resource.line
      "%s:%d" % [resource.file, resource.line]
    else
      "Unknown"
    end
  end
end
