Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16272228241
	for <lists+linux-clk@lfdr.de>; Tue, 21 Jul 2020 16:32:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729444AbgGUOcC (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 21 Jul 2020 10:32:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729107AbgGUOcC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Jul 2020 10:32:02 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8D52C0619DC
        for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2020 07:32:01 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id j11so24288848ljo.7
        for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2020 07:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ccCSIZDNTg+p8llAxmwk1xbTQUtctPkb4u7L4YN3FhU=;
        b=YGwCpSa9uQHZlKOTp3ggSWPmLN4wu9gdo/R7JrLQSOS/mmgN3z/6CzAhrrvqIuWLKB
         wKaEHpo6LNzr8ww1zPupQtgrDxErj9iN3hqFocryOaHY4O7nRyWYT6AsXZv5VirphXdy
         KgTIOiHBJT6QIFoYxbqMMnesDW4+T/wquWY68zp6UQwi3eCehrGE+rZmG6jWbkLDWG8/
         GmAsfDDjRQOsCQgbfPDDCYkVkGF7BaGAQbjAXpWjEPgz/C2xAk7Y9C3EwYR3B8GCsFY5
         a2ytAf4onEOomoa62ltrjKvTgdC+AjhDEldbX8PM6wS+/koRCB7UvsusERgQCBrZBS++
         smSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ccCSIZDNTg+p8llAxmwk1xbTQUtctPkb4u7L4YN3FhU=;
        b=F2+tHGtBB5kZVedesNJbupda2ODT+sBqqzABwavkW+uWXknmRQRZpwcBgl0Mrf/3El
         ebBsKVvEruGMqLc0Ec5gSgdWU5GPp+c48o1IT/edaIg9+ynf8q1G4nTM+hAWQqfnUnQp
         l1OtOn7/wsAbtAmMYowxv9vZGjqdPTUF4x5DafF2Qfmtkk4ZqD9md+sTZRE+wqgm26Az
         uw5/un6TYeBz96NVt9WWOsF7lZTyA2QGKRCOLoJw3H+ehBkyrZwaeeq74svlLl1yVW9f
         gPMzt9i77Jbi9sF0seqwK7CkJN1r6R4AMz0LHRwebH2sYapoXxlAWOTYVnVh7BWxKkcN
         Gnqg==
X-Gm-Message-State: AOAM530AjuW1L4+JCLbmUdQ3dINkVMkJzGzyTqQap7JMqdIzCRSVOwQi
        e4nwHlR6fmMypydKVpqu1KXXow==
X-Google-Smtp-Source: ABdhPJzCfrnizMtMlg10UOHgQpLbdnlHhI/Gla/f8xk+Qm4TB60yz7n7cAdIV7DxBsDp6NOvE28mKQ==
X-Received: by 2002:a2e:9006:: with SMTP id h6mr12308130ljg.148.1595341919986;
        Tue, 21 Jul 2020 07:31:59 -0700 (PDT)
Received: from [192.168.1.211] ([94.25.229.9])
        by smtp.gmail.com with ESMTPSA id d6sm4537941lja.77.2020.07.21.07.31.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2020 07:31:59 -0700 (PDT)
Subject: Re: [PATCH v0] clk: qcom: gcc: Update disp gpll0 branch for 7180/845
To:     Taniya Das <tdas@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@google.com
References: <1594796050-14511-1-git-send-email-tdas@codeaurora.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <69dccde9-f577-6266-07cb-820930bace68@linaro.org>
Date:   Tue, 21 Jul 2020 17:31:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594796050-14511-1-git-send-email-tdas@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 15/07/2020 09:54, Taniya Das wrote:
> The display gpll0 branch clock needs to be always left enabled, thus
> move the clock ops to _aon branch ops.

Does this also apply to sm8250/sm8150?

> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>   drivers/clk/qcom/gcc-sc7180.c | 2 +-
>   drivers/clk/qcom/gcc-sdm845.c | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
> index ca4383e..538677b 100644
> --- a/drivers/clk/qcom/gcc-sc7180.c
> +++ b/drivers/clk/qcom/gcc-sc7180.c
> @@ -1061,7 +1061,7 @@ static struct clk_branch gcc_disp_gpll0_clk_src = {
>   				.hw = &gpll0.clkr.hw,
>   			},
>   			.num_parents = 1,
> -			.ops = &clk_branch2_ops,
> +			.ops = &clk_branch2_aon_ops,
>   		},
>   	},
>   };
> diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
> index f6ce888..90f7feb 100644
> --- a/drivers/clk/qcom/gcc-sdm845.c
> +++ b/drivers/clk/qcom/gcc-sdm845.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0
>   /*
> - * Copyright (c) 2018, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2018, 2020, The Linux Foundation. All rights reserved.
>    */
> 
>   #include <linux/kernel.h>
> @@ -1344,7 +1344,7 @@ static struct clk_branch gcc_disp_gpll0_clk_src = {
>   				"gpll0",
>   			},
>   			.num_parents = 1,
> -			.ops = &clk_branch2_ops,
> +			.ops = &clk_branch2_aon_ops,
>   		},
>   	},
>   };
> --
> Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
> of the Code Aurora Forum, hosted by the  Linux Foundation.
> 


-- 
With best wishes
Dmitry
