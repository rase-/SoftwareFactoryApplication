(->
    cached = null
    
    module.exports.isCached = ->
        cached != null
    module.exports.getCached = ->
        cached
    module.exports.useCached = (callback) ->
        callback cached
    module.exports.cache = (toCache) ->
        cached = toCache
    module.exports.clearCache = ->
        cached = null
)()
