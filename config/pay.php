<?php

/**
 * 支付配置项
 */
return [
    'alipay' => [
        // 支付宝商户的 appid
        'app_id'            => '2016092400588380',
        // 支付宝的公钥
        'ali_public_key'    => 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAv1t74og4rNVZnS/Sed/ADlHwYoWoyfBoFHS6Vve8SJKOue0h2zs/evapCBbw7ovHj43e9xcwNkl4IrvNgxOM1n0v1E59/7WFY+etU5u4soa8mba5oRfqv/uqJ9QFuhikhwa1WqDrX73EGSZ/64fLKFooyJZP8SFS8QikkJ83oZRpT4sYp/6HeB0v5COoPIUKv+ui7lMx4mIf3CsS4yQvuAwT33Bhuue2WnGf6GSIzUEyhPRlIjJ792YQ88uHESG8ouGICR3OgN7QRI6yipaBVsEY64LQYqLrrVFsFFg4xv3mYkNQps+o89hRxc1HuH4dw6i3mNLziLT0zCmU9zBILQIDAQAB',
        // 支付宝的私钥
        'private_key'       => 'MIIEogIBAAKCAQEAn50TjYklymeUjTp+5QxJd//xzm4T+1w27UTqB0CX/ontash1Mga6QvGqnllNfsckqpBR8H13bCfsnMbCH2Y4Eu3jr/vtQ7N7kuUA3BVrxLNJhXi5kbqWOb3igwltvfOBXmQDlubpWTY/tdpDCBwVakVM7i68fBEI/v9c91pBLvhXH5LkpnxPJEHA3wsN9B65VUALiVHog19914LIwWANasxz4Xg2uIRDheygCIhHZkzO38JJ2g51zZP5AmL+aZNaBv2Sl+DFPkhaiL4268rJm/MPc+z9qRoC2MChoxykysTRFIg8ZiQiYcBR3NxuFk764Ch8mUqena3scN/0TjJTuQIDAQABAoIBAFoFurhyKNlOsE8zNcyzsGA4/8Wg+i4j5WrPGnt6p/9NBZXbd5X+i2EkckmbLoUZhomYmk5cRVW/8si9pVEWUvwCJg/ks/4iJclE1cZLYpvvTsEzxN33cbEhcrbbQ4UF6Oo22HtswyGo4igL8RCK3l0wtuIDhBUpenxvxJxR0D/Ptu3Oov67896iXQuquzJZY0LX+pErIba1MszFYBDUsPBEgbBjYnrerCNzh7/U2w4YC0ZTHkgazST4gIQXfvmwAJt2yrBNmFpvoOiBce1+gtDMFR7xlORvaZFxISUKk/99UfLEjkyTFU5AKzLVJZf/cfLVjqKWqS+iJNAj1IukFwECgYEA1IARWy5JHgFvrxrYvE4dvJYRbX/eB6NONNth+8hSGxaN/YsCNNcaN75gveZCQyLiS77mUlvk/FfG/lV8jYL7TLfT/qAkuTdSdCm8ipSy7/gLK6IaEoeDCE0x/vCTTDQQyemMFGDBYZiSGCjcyCf1Os19YNvWDa1g4tjk/n3hTOECgYEAwEmEiYlFxRFoSw6If4gYESDCN9TKZZpviRAg9gqs7lODgZ0eMESgO9gPV2ZX67Ypq38eBXJk+QBMnLqnoUwbMNl0dYx6nS3HsDI8RQ/7g650X9OiNAaOWyJM3t4y7phXqzhD6FnQ6phJqZjYz997A/cNMiMhsWz/nEDemBjMSdkCgYBA9zZXLftklQPUAN0qFKe6tBZ355O1uhN6zWdTVpbjeS3HyevOw8RcLnPdGrw/Ujbk+WPo4fdLvnoz32bIzLaPadQCEGupxGQM54WgyH08KBUiLdjSuWMx8ofKbTpbHb/UOvZ8dGgqsj5X7IYzGyQ56gDez9bNL6hjMfQwacOrgQKBgC3SFwwzMvYH9ONV3j8NrjZ+qOlnAqf9ijCOMFyRJK5SJlc/mo8D+27nSJiaIb9glENysjO4E8mmQZtje0ibeytD1lWgmSNVYm1hOy115oh1jPO82b0uBsQ+wzSknFxw3wtFCCGZLYiJq5wHeTrn1UeXmoRlDMVb5PlWF/UEi8HZAoGAMpXx/PEeU61azxAdwgblVNKVPAOH8+O0QnjEJ8+sBboVxFK1X4yTNIUQOrZjPpEbhrCba2533mJSFoN6daOAeXNvDRNhgNBWiGchV6U3SKsbBpKKYfS/SesPnBnVaPXc7/8Wfe6rNoBOtiylhQBkCvoH3IotPOO1QSEsotHlyRk=',
        'log'               => [
            'file'  => storage_path('logs/alipay.log')
        ]
    ],
    'wechat' => [
        'app_id'        => '',
        'mch_id'        => '',
        'key'           => '',
        'cert_client'   => '',
        'cert_key'      => '',
        'log'           => [
            'file' => storage_path('logs/wechat_pay.log')
        ]
    ]
];
