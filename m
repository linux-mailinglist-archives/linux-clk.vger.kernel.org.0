Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5A3D1EC5C5
	for <lists+linux-clk@lfdr.de>; Wed,  3 Jun 2020 01:33:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726223AbgFBXdC (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 2 Jun 2020 19:33:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727898AbgFBXdC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 2 Jun 2020 19:33:02 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16980C08C5C2
        for <linux-clk@vger.kernel.org>; Tue,  2 Jun 2020 16:33:02 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id d128so115983wmc.1
        for <linux-clk@vger.kernel.org>; Tue, 02 Jun 2020 16:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gRIfKnJl6SPT0TJEscdrNR/IF4u0o0KTS5V3RmcEUyM=;
        b=JKBZK0fKK1R/SWy7yxMUC8suZIyxultiSmdoxR3UvAqPTsEh9pJ12gIrHrzxSaP/wJ
         1KwHQ4uoqdDgRKP0rUf2ngjWH7KZegwN3bN3V0kq9BXoNNPADqqSu7p+CrNekbPkRtfT
         XY2cvpv2j70n9V+knYIMoo6y+UfAxd1/go08NJBEzjSHP9N5MB0RJKmI28BhLy7XlwqM
         lCJxePHePQ8cjXxRuURh2oe5D/XWTn2F/3MKpL6fOZbesn/sVSh3daVKWyOccvCXi45v
         Iu9yNec0gWwQRQBwywqYhtf4mEyXK3s/RT4q/DGWc/HUW/7/sM2ur/sD8LjJgaMuomWc
         LLwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gRIfKnJl6SPT0TJEscdrNR/IF4u0o0KTS5V3RmcEUyM=;
        b=DCFUjHhih7I+rhcnmH98PdxMQhBME24z313hDVYEFr/jjqCtHW7LC5HMl168bFGJLl
         Mb1hdC1bfESst/8oQ87CDArzd4JtX+QxpzCUpQ4fisxWRqcETLtiuvP4jbUgHuabRvuQ
         sZxlz4JR96i4B6Na6umzCbdw3/Hy+4HXKfc1HSdvq6TiyNTqUhcSBxV8PaykhKEDq2sn
         eifoyMDF5TspUphU7gk/I9utpJXEOsuaq/idtp/W7XwAtMtPy/OqvCgaFTsqRvwC6sZv
         qlTTfR97/di/knM6k4NivpxYJ7hm05KjanLshwop03eAiKZvRt7JX0RUDMX9mm2iWVZt
         l7SQ==
X-Gm-Message-State: AOAM533567jE11aXHn6KUTHY7bWZuIMXVbeO/c579fxn/WqtqQ7l3yYy
        eV0Z4AQ5srUU6j0eNome+Xm1ZNr89qE=
X-Google-Smtp-Source: ABdhPJwcp1KiPxegia0Y7JYvV9kaPCj1e5qD1uO6/BUPm79pbtxCR2NUJxnMNO9b3KYzZzZvZw3CLg==
X-Received: by 2002:a1c:5987:: with SMTP id n129mr5999760wmb.60.1591140780694;
        Tue, 02 Jun 2020 16:33:00 -0700 (PDT)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id l18sm418067wmj.22.2020.06.02.16.32.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2020 16:33:00 -0700 (PDT)
Subject: Re: [PATCH 1/4] drivers: clk: qcom: Add msm8992 GCC driver
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200531174612.260113-1-konradybcio@gmail.com>
 <20200531174612.260113-2-konradybcio@gmail.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <7e618280-ecb8-cf1a-5243-737e56278662@linaro.org>
Date:   Wed, 3 Jun 2020 00:33:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200531174612.260113-2-konradybcio@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 31/05/2020 18:46, Konrad Dybcio wrote:

> +static struct clk_fixed_factor xo = {
> +	.mult = 1,
> +	.div = 1,
> +	.hw.init = &(struct clk_init_data)
> +	{
> +		.name = "xo",
> +		.parent_names = (const char *[]) { "xo_board" },
> +		.num_parents = 1,
> +		.ops = &clk_fixed_factor_ops,
> +	},
> +};

I think you can drop that, and use the DTS definition.

xo_board: xo_board {
     compatible = "fixed-clock";
     #clock-cells = <0>;
     clock-frequency = <19200000>;
};

sleep_clk: sleep_clk {
     compatible = "fixed-clock";
     #clock-cells = <0>;
     clock-frequency = <32768>;
};

clock_gcc: clock-controller@fc400000 {
     compatible = "qcom,gcc-msm8994";
     #clock-cells = <1>;
     #reset-cells = <1>;
     #power-domain-cells = <1>;
     reg = <0xfc400000 0x2000>;

+    clock-names = "xo",
+                  "sleep_clk";
+    clocks = <&xo_board>,
+             <&sleep_clk>;

};


> +static int gcc_msm8992_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct clk *clk;
> +
> +	clk = devm_clk_register(dev, &xo.hw);
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);

You should drop this too.


> +MODULE_ALIAS("platform:gcc-msm8992");

and that.

---
bod

