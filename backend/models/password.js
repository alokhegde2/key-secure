const mongoose = require('mongoose');


//Schema 

const passwordSchema = new mongoose.Schema({
    appName:{
        type:String,
        required:true,
        min:6,
        max:255
    },
    appUserId:{
        type:String,
        max:255,
        min:6,
    },
    appPassword:{
        type:String,
        required:true,
        min:20
    },
    appMailId:{
        type:String,
    },
    userId:{
        type:mongoose.Schema.Types.ObjectId,
        ref:'User',
        required:true
    },
    appType:{
        type:String,
        required:true
    },
    isFavourite:{
        type:Boolean,
        default:false
    },
    note:{
        type:String,
        default:""
    },
    date:{
        type:Date,
        default:Date.now
    },
});

passwordSchema.virtual('id').get(function(){
    return this._id.toHexString();
})

// passwordSchema.set('toJSON',{
//     virtuals:true,
// })

passwordSchema.virtual('userID').get(function(){
    return this.userId.toHexString();
})

passwordSchema.set('toJSON',{
    virtuals:true,
})

module.exports = mongoose.model('Password',passwordSchema);