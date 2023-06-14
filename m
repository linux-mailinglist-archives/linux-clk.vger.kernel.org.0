Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B32F2714922
	for <lists+linux-clk@lfdr.de>; Mon, 29 May 2023 14:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231669AbjE2MM3 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 29 May 2023 08:12:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231549AbjE2MM2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 29 May 2023 08:12:28 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B4A5CF
        for <linux-clk@vger.kernel.org>; Mon, 29 May 2023 05:12:26 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2af1822b710so33582121fa.1
        for <linux-clk@vger.kernel.org>; Mon, 29 May 2023 05:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685362345; x=1687954345;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J3ABGit/TAcsKmvTN4UN3Tm0XCYfzg7S6lZfJii5Jc8=;
        b=iDCNWDAAPFR3sv+Wq7fS+gD5r5IBEPuVOnLNoCD8PIF5/Vi3zsZAwck9+OOI1fxqLJ
         H7mtn5fH2zgJt1bl3iWw4KEC49pegNqX2TZZ0U9kTVJFj5oYf8zoKjo1ra/+Ak5dJTdh
         rwFWqXacCi2pdV9HqB7v1Bijg8jsgb9p3ulP421FjIYtiu+HM3sDqJGS1rgmnIeS3DEo
         46cka1D5vuEu8Qi+VKjIeEjUgmi//lC4j4dcQf7TGRzhkMhkeP3VBXi1pMBOVgOnzqGn
         tuZLnFsGOUpch9UipgtpptorJ0p6LctUwGjz+iwu2ew0Nx225Syvd0qaNzWDIRCoUnjO
         qvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685362345; x=1687954345;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J3ABGit/TAcsKmvTN4UN3Tm0XCYfzg7S6lZfJii5Jc8=;
        b=BK+Iqp8cyun70i1VQ7Z5vxs3DHZaFtQp5BrqZou0n+rqWHDzpsKPhYQ+LQZz3VaXxN
         isDOPM+F6/G4fOYgm3gLrlrJwI4SnZ9dGPWPmiijPDS6Fou4Ga5i+70kvQN8OFtq2Ef3
         samAgrrbb0dPBq5LwBCFpXKzATl+7Nm3/IMaYJKoovYeFzKclAxeJXUCQVlgtLJ1+Cef
         a0CtFU7JZ/1+Cju9eT6pHuXeOvubrUIWyJiyY9TYRef/SJ2/EMaUpGDnqdiJC8q5y69q
         mIWAnqUGfyG412Nz3xWdmtrrUymTSf4sMcoBswEBRhR0s06U26gqdTe6qQXcq0CjdZ+v
         IP2w==
X-Gm-Message-State: AC+VfDydyvbuxJLFJwMh3giPX8hxtOXiEt4d/VSrNoCYp+auNTj3dZsZ
        h6sLehjNFPUqz7G+SYCZThtwTA==
X-Google-Smtp-Source: ACHHUZ4kCnD4vAXW9BnOp6OGw0h8Enwzq8eA8ZxzcUP+eEZQL/r/53Opp+YGpZFQcsv39OC09fdj3Q==
X-Received: by 2002:a2e:9e8e:0:b0:29f:58c6:986e with SMTP id f14-20020a2e9e8e000000b0029f58c6986emr3427027ljk.52.1685362344708;
        Mon, 29 May 2023 05:12:24 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id o11-20020a2e730b000000b002a8c409f1f5sm2412067ljc.110.2023.05.29.05.12.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 05:12:24 -0700 (PDT)
Message-ID: <4afbcdd0-a11c-4826-d669-2ffc9488a8b6@linaro.org>
Date:   Mon, 29 May 2023 14:12:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v4 2/3] clk: qcom: clk-rcg2: add support for rcg2 freq
 multi ops
Content-Language: en-US
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230427150717.20860-1-ansuelsmth@gmail.com>
 <20230427150717.20860-3-ansuelsmth@gmail.com>
 <82072c2b-8483-6fb6-a9d1-c9882825c9cb@linaro.org>
 <6473e34c.df0a0220.33a79.6c95@mx.google.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <6473e34c.df0a0220.33a79.6c95@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 28.05.2023 14:37, Christian Marangi wrote:
> On Sat, May 27, 2023 at 06:11:16PM +0200, Konrad Dybcio wrote:
>>
>>
>> On 27.04.2023 17:07, Christian Marangi wrote:
>>> Some RCG frequency can be reached by multiple configuration.
>>>
>>> Add clk_rcg2_fm_ops ops to support these special RCG configurations.
>>>
>>> These alternative ops will select the frequency using a CEIL policy.
>>>
>>> When the correct frequency is found, the correct config is selected by
>>> calculating the final rate (by checking the defined parent and values
>>> in the config that is being checked) and deciding based on the one that
>>> is less different than the requested one.
>>>
>>> These check are skipped if there is just on config for the requested
>>> freq.
>>>
>>> qcom_find_freq_multi is added to search the freq with the new struct
>>> freq_multi_tbl.
>>> __clk_rcg2_select_conf is used to select the correct conf by simulating
>>> the final clock.
>>>
>>> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
>>> ---
>>>  drivers/clk/qcom/clk-rcg.h  |   1 +
>>>  drivers/clk/qcom/clk-rcg2.c | 152 ++++++++++++++++++++++++++++++++++++
>>>  drivers/clk/qcom/common.c   |  18 +++++
>>>  drivers/clk/qcom/common.h   |   2 +
>>>  4 files changed, 173 insertions(+)
>>>
>>> diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
>>> index dc85b46b0d79..f8ec989ed3d9 100644
>>> --- a/drivers/clk/qcom/clk-rcg.h
>>> +++ b/drivers/clk/qcom/clk-rcg.h
>>> @@ -188,6 +188,7 @@ struct clk_rcg2_gfx3d {
>>>  
>>>  extern const struct clk_ops clk_rcg2_ops;
>>>  extern const struct clk_ops clk_rcg2_floor_ops;
>>> +extern const struct clk_ops clk_rcg2_fm_ops;
>>>  extern const struct clk_ops clk_rcg2_mux_closest_ops;
>>>  extern const struct clk_ops clk_edp_pixel_ops;
>>>  extern const struct clk_ops clk_byte_ops;
>>> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
>>> index 76551534f10d..4f2fe012ef5f 100644
>>> --- a/drivers/clk/qcom/clk-rcg2.c
>>> +++ b/drivers/clk/qcom/clk-rcg2.c
>>> @@ -266,6 +266,104 @@ static int _freq_tbl_determine_rate(struct clk_hw *hw, const struct freq_tbl *f,
>>>  	return 0;
>>>  }
>>>  
>>> +static const struct freq_conf *
>>> +__clk_rcg2_select_conf(struct clk_hw *hw, const struct freq_multi_tbl *f,
>>> +		       unsigned long req_rate)
>>> +{
>>> +	unsigned long best_rate = 0, parent_rate, rate;
>>> +	const struct freq_conf *conf, *best_conf;
>>> +	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
>>> +	struct clk_hw *p;
>>> +	int index, i;
>>> +
>>> +	/* Exit early if only one config is defined */
>>> +	if (f->num_confs == 1)
>>> +		return f->confs;
>>> +
>>> +	/* Search in each provided config the one that is near the wanted rate */
>>> +	for (i = 0, conf = f->confs; i < f->num_confs; i++, conf++) {
>>> +		index = qcom_find_src_index(hw, rcg->parent_map, conf->src);
>>> +		if (index < 0)
>>> +			continue;
>>> +
>>> +		p = clk_hw_get_parent_by_index(hw, index);
>>> +		if (!p)
>>> +			continue;
>>> +
>>> +		parent_rate =  clk_hw_get_rate(p);
>>> +		rate = calc_rate(parent_rate, conf->n, conf->m, conf->n, conf->pre_div);
>>> +
>>> +		if (rate == req_rate) {
>>> +			best_conf = conf;
>>> +			break;
>>> +		}
>>> +
>>> +		if (abs(req_rate - rate) < abs(best_rate - rate)) {
>> Shouldn't this be:
>>
>> if (abs(req_rate - rate) < abs(best_rate - req_rate)
>>
>> ?
>>
>> this way it'd say
>>
>> "if this iteration's rate is closer to the requested one than the
>> best one we've found yet, it's better"
>>
> 
> Hi, thanks for the review!
> 
> I wonder if even better would be something where we save the best rate
> diff and just compare that.
> 
> rate_diff = abs(req_rate - rate)
> if (rate_diff < best_rate_diff) {
> 	best_rate_diff = rate_diff;
> 	best_conf = conf;
> }
> 
> And best_rate_diff init to ULONG_MAX?
Yeah that would be more readable!

> 
>>> +			best_rate = rate;
>>> +			best_conf = conf;
>>> +		}
>>> +	}
>>> +
>>> +	/*
>>> +	 * Very unlikely.
>>> +	 * Force the first conf if we can't find a correct config.
>>> +	 */
>>> +	if (unlikely(i == f->num_confs))
>>> +		best_conf = f->confs;
>> Is that a supported scenario or would it be a device driver / clock
>> driver error?
>>
> 
> It's to handle case for the 2 continue in the loop and arriving in a
> situation where best_conf was never set?
> 
> Should we return a warning and an ERR_PTR? Idea was to provide a best
> effort selection.
Hm.. I'm not sure what's the expected behavior here.. Stephen?

Konrad
> 
>>> +
>>> +	return best_conf;
>>> +}
>>> +
>>> +static int _freq_tbl_fm_determine_rate(struct clk_hw *hw, const struct freq_multi_tbl *f,
>>> +				       struct clk_rate_request *req)
>>> +{
>>> +	unsigned long clk_flags, rate = req->rate;
>>> +	const struct freq_conf *conf;
>>> +	struct clk_hw *p;
>>> +	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
>> swap lines 2, 3, 4 to 4, 2, 3 and you'll get a revers-Christmas-tree!
>>
> 
> Thanks, didn't notice this. Will do in v5.
> 
