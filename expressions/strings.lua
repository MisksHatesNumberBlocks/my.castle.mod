Expression = {
   expressions = {},
   BaseExpression = {
      expressionType = "base",
      category = "strings",
      returnType = "nil",
      params = nil,
   },
}

Expression.expressions["join strings"] = {
   returnType = "string",
   description = "join two strings",
   order = 1,
   paramSpecs = {
      lhs = {
         label = "First string",
         method = "textArea",
         initialValue = "",
         expression = false,
      },
    rhs = {
         label = "Second string",
         method = "textArea",
         initialValue = "",
      },
   },
   eval = function(game, expression, actorId, context)
      return (lhs .. rhs)
   end
}

Expression.expressions["string"] = {
   returnType = "string",
   description = "an string",
   order = 2,
   paramSpecs = {
      variableId = {
         label = "Text",
         method = "textArea",
         initialValue = "",
      },
   },
   eval = function(game, expression, actorId, context)
      return expression.params.value
   end
}

Expression.expressions["number"] = {
   returnType = "string",
   description = "length of an string",
   order = 3,
   paramSpecs = {
      string2 = {
         label = "Text",
         method = "textArea",
         initialValue = ""
      },
   },
   eval = function(game, expression, actorId, context)
      return string.len(expression.params.value) 
   end
}

Expression.expressions["reverse string"] = {
   returnType = "string",
   description = "reverse a string",
   order = 4,
   paramSpecs = {
      string3 = {
         label = "Text",
         method = "textArea",
         initialValue = "",
      },
   },
   eval = function(game, expression, actorId, context)
      return string.reverse(expression.params.value)
   end
}
