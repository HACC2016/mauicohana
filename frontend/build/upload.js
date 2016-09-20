/*eslint-disable no-console */
import config from './webpack.prod.conf';
import colors from 'colors';
import s3 from 's3';
import AWS from 'aws-sdk';

let server = process.argv[2];
let accessKeyId, secretAccessKey, s3DistributionId = null;

s3DistributionId = process.env.HACC_S3_DISTRIBUTION_ID;
accessKeyId      = process.env.HACC_S3_ACCESS_KEY_ID;
secretAccessKey  = process.env.HACC_S3_SECRET_ACCESS_KEY;

let client = s3.createClient({
  s3Options: {
    accessKeyId:     accessKeyId,
    secretAccessKey: secretAccessKey
  }
});

let s3Params = {
  localDir: config.output.path,
  deleteRemoved: true,
  s3Params: {
    Bucket: "hacc2016",
    Prefix: ""
  }
};
let uploader = client.uploadDir(s3Params);
uploader.on('error', function(err) {
  console.error("unable to sync:", err.stack);
});
uploader.on('progress', function() {
  console.log("progress", uploader.progressAmount, uploader.progressTotal);
});
uploader.on('end', function() {
  console.log("done uploading");
});


// =============================================================
// Invalidate Cache on Cloudfront
// =============================================================

let cloudfront = new AWS.CloudFront({accessKeyId: accessKeyId, secretAccessKey: secretAccessKey});

const items = [ '/bundle.js', '/bundle.js.map', '/index.html', '/styles.css', '/styles.css.map' ];

let awsParams = {
  DistributionId:  s3DistributionId,
  InvalidationBatch: {
    CallerReference: (String(new Date().getTime())),
    Paths: {
      Quantity: items.length,
      Items: items.map(encodeURI)
    }
  }
};
// cloudfront.createInvalidation(awsParams, function(err, data) {
//   if (err) console.log(err, err.stack); // an error occurred
//   else     console.log(data);           // successful response
// });
