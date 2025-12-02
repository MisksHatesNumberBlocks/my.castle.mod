Expression = {
   expressions = {},
   BaseExpression = {
      expressionType = "base",
      category = "strings",
      returnType = "nil",
      params = nil,
   },
}

function Common:evalExpression(maybeExpression, actorId, context, paramSpec)
   local result
   local typ = type(maybeExpression)
   if typ == "table" and Expression.expressions[maybeExpression.expressionType] then
      result = Expression.expressions[maybeExpression.expressionType].eval(self, maybeExpression, actorId, context)
   else
      -- not an expression, so treat as a primitive
      result = maybeExpression
   end

   -- if provided, validate result according to spec
   if paramSpec ~= nil then
      if paramSpec.props ~= nil then
         if paramSpec.props.min ~= nil and result < paramSpec.props.min then
            result = paramSpec.props.min
         end
         if paramSpec.props.max ~= nil and result > paramSpec.props.max then
            result = paramSpec.props.max
         end
         if paramSpec.props.discrete ~= nil then
            result = math.floor(result)
         end
      end
   end

   return result
end

function Common:defineExpression(expressionType, expression)
   Expression.expressions[expressionType] = util.deepCopyTable(expression)
end

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
      return game:variableIdToValue(expression.params.variableId)
   end
}

Expression.expressions["number"] = {
   returnType = "string",
   description = "length of an string",
   order = 1,
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
   order = 1,
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
