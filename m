Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 290A036A68
	for <lists+linux-clk@lfdr.de>; Thu,  6 Jun 2019 05:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbfFFDP3 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 5 Jun 2019 23:15:29 -0400
Received: from mail-pf1-f172.google.com ([209.85.210.172]:39230 "EHLO
        mail-pf1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726519AbfFFDP3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Jun 2019 23:15:29 -0400
Received: by mail-pf1-f172.google.com with SMTP id j2so568709pfe.6
        for <linux-clk@vger.kernel.org>; Wed, 05 Jun 2019 20:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aQaPbWDXavNRu7iOgwRHmYDUom2MXcE3ZI99h8uIByc=;
        b=WZ3Fvdh/fIOmKtwoVSjN3gj8nuE5cMhxReyGHL+oQM9kaT3bVtXy34TL5mC7J49hhU
         LRN13bJQACT1qMLH4c4haFMqz66iiDDvz2IzI/92IUs6DZlZyeMYecwylfSkvE3bS5Do
         ardjEJSLUx8yI5ggqluKPlCFYPju3HLQPq4YC6YZg2V+XZv/2FexM4CTFiEaU5L4uXvx
         aT4DAGPzbqf7v/OeXP1qDBZ8faJpWcR5eRqO+5Bov9N7XgwkDISA/BOef4xEO5MdkWE9
         lOpQBvnNxHrYGIHbyxMCtworrsd5yaMo5Cz5uphqlYeuM2nNJXgApz1k2XvmFha1hxCO
         Mv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aQaPbWDXavNRu7iOgwRHmYDUom2MXcE3ZI99h8uIByc=;
        b=iDsUcDULmWlmTgXHHhIZgGv2pQNDOMvcKXNC9wvVL0QcvzIZ0fFsQvh+HwygMf5L97
         94Vmy7uytxqxvr5djPFvWz6hhxLO0DLaTBKU5yH42HEORRp4kgcsakHsr+KQpFzMlJkn
         jQunN8OkFpMMrM/iWc/zOvuuovdrbckwOfy42U3nA4zGAf8Pav2EkaKXOl6udSZn/ws7
         IV9O+6bSTwaXS1kkXdb64MI1mt4iAxI8sWeJJtL7la/4Ze5u010Cm9uxDi+rizvxaK0S
         mcwUJ1unj6wBg8wZQwv2HabJy0Ig8GIL7aKU3M8Dfgqx2b3b3+sP2UzBkbrEfuECodEF
         +aew==
X-Gm-Message-State: APjAAAUEuOdK4YOIEwr6iHcAPLQJ61WL1CtPdoh+HoxCs9sE3ZuxeEJT
        ddLbXGVAtnuGUEMlu1s1OIoujg==
X-Google-Smtp-Source: APXvYqx3naFQT7F/C/KDKO36iTavZgfZJHhHPggIkqir5gQYvj8f0p7/nEzDq+JMzQ8ZwOdj+E/eJQ==
X-Received: by 2002:a65:6295:: with SMTP id f21mr1221471pgv.416.1559790928747;
        Wed, 05 Jun 2019 20:15:28 -0700 (PDT)
Received: from localhost ([122.172.66.84])
        by smtp.gmail.com with ESMTPSA id o20sm258525pgj.70.2019.06.05.20.15.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 20:15:28 -0700 (PDT)
Date:   Thu, 6 Jun 2019 08:45:26 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Leonard Crestez <leonard.crestez@nxp.com>
Cc:     Anson Huang <Anson.Huang@nxp.com>, Stephen Boyd <sboyd@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Alexandre Bailon <abailon@baylibre.com>,
        Jacky Bai <ping.bai@nxp.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>, kernel@pengutronix.de,
        linux-clk@vger.kernel.org, linux-imx@nxp.com,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC] devfreq: Add generic devfreq-dt driver
Message-ID: <20190606031526.xknv5qdoqufim6tr@vireshk-i7>
References: <e48d7e3d71166cea20c3c200300e0ffa6d26d085.1559737589.git.leonard.crestez@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e48d7e3d71166cea20c3c200300e0ffa6d26d085.1559737589.git.leonard.crestez@nxp.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 05-06-19, 15:31, Leonard Crestez wrote:
> +static const struct of_device_id devfreq_dt_of_match[] = {
> +	{ .compatible = "generic-devfreq", },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, devfreq_dt_of_match);

DT can't contain nodes for any virtual devices, this will have similar
problems to cpufreq-dt. How is this driver going to get probed ? Who
will create the device ?

> +static struct platform_driver devfreq_dt_platdrv = {
> +	.probe		= devfreq_dt_probe,
> +	.shutdown	= devfreq_dt_shutdown,
> +	.driver = {
> +		.name	= "devfreq-dt",
> +		.of_match_table = of_match_ptr(devfreq_dt_of_match),
> +	},
> +};
> +module_platform_driver(devfreq_dt_platdrv);
> +
> +MODULE_DESCRIPTION("Generic devfreq-dt driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.17.1

-- 
viresh
