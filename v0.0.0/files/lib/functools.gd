_methods = {"bind": bind}

func bind(callback, ...values):
    return callback.bindv(values)