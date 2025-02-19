Return-Path: <linux-clk+bounces-18289-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BEDA3AECC
	for <lists+linux-clk@lfdr.de>; Wed, 19 Feb 2025 02:22:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C1C516AD2D
	for <lists+linux-clk@lfdr.de>; Wed, 19 Feb 2025 01:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C797DA95;
	Wed, 19 Feb 2025 01:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YGvoaW+5"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00ACB13E41A
	for <linux-clk@vger.kernel.org>; Wed, 19 Feb 2025 01:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739928119; cv=none; b=C1euHJD3OJeoFMWIt7sAHsQjzrpmTUZq+pAA5G2cMq5hLIlhSmTjQrvYIdDF0hQCW/ob/1+IZABBM0rSR8uHfLmuQ8DkgUzdxP0uvmNtuMwM0oBKXFBwkTkH3RdEIzWw4SVFM1HffvBLpLB5Wn7OWzqOybGmw6xEWFCIuNbxMZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739928119; c=relaxed/simple;
	bh=NUt+WhfYOlp4kXMW9MxPdyJMSiWLp/jAUdJTomvveTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k2A0776hWNyj/5TPVpliEs8L5vggB0NrsWzoBKZQeIc3+EOofLtLBVWjv4apBqBvOlq9tQOKrz6v8B+1xh4F/GzgP54/Bn6hmmS0NwbP63V8HyvbJ4F39I0K4dVm+ZGGbbiMKBGq7g0iDl3Ji6tub1HzUp95UhdLp+YxgvB/aGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YGvoaW+5; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38f265c6cb0so2791747f8f.2
        for <linux-clk@vger.kernel.org>; Tue, 18 Feb 2025 17:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739928115; x=1740532915; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AXv+OqhH2y0iO9EGU1OunJFaKUzVPNS3CZeDRTVc1uU=;
        b=YGvoaW+5rChOpqDI+5lnBJRCR256D6A9zqeb2aVv29OQAM4LyH11cGpVUIEBnGoyIv
         GAifX078dGv+XeMwCzR20fu4V7TSQSiDQkxMK81DqOnME+bFUPJwljocvumwXPSKspG/
         oJ02xeqmKIo+dCu7u+SUudC8ba8AjspA1St1pgkv+/45mioxTp1dlam81yUngHULeOHS
         2HPU/Jc1HmFFgFsn4NYWwni/XN9j1p2ubUWW0eXQqggG4NYt5K4BuGzkWuiUPqZPZXtV
         KIr+iEYxzV30AZfZ274oNxfTu8j0s0c3QwpnEs8MZdtFM3+SSd1RGY7vdT5TmS0dgpsb
         0s7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739928115; x=1740532915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AXv+OqhH2y0iO9EGU1OunJFaKUzVPNS3CZeDRTVc1uU=;
        b=QilKtxnydQaWXDp/B7cKiMI1vituwxQIzw8ZfEaBYlVA0EbJHgH1zHTiV1eZ1HYCqi
         CWJW5BxaaSDQ733FwX727SD2DGjCpipZCA+04lahW55Y5iDuDTwU8Dw/HXNmwBZqqxdW
         ihPCFIHiIcnbyrFf8JQ6p60j3ppwtYYaW3OWN7gQ7Zq8ao4mxkrLcZnQfQUbuGLyBvlr
         MvsbYCrmZ9W+xrc15cBEu8WUxZ22tn9bgD7AxaZE4x0z63fjT+cYLXXMJuBKidcj1tOM
         xmfW79Za1gGqTD+aYV5RB4ISILeEKFF+Ld5dYKjnkBc9mVjy2+aVFXhSfnyXqBVVH0BA
         9Csw==
X-Forwarded-Encrypted: i=1; AJvYcCXxBKMDQV7qw4cr+TF21TzaHhJdiyKu0wqhw5EG/pntQXCzLLHlKhIrnIqtdaQ2gtzwkJ9oVuJV5rQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN0FKciUKRPjOu2NWdU25Q4wQlaMAmpPYkdPsBBs2xaj8mEX6v
	quE5olmZgFP6rTYNtXmgupS9CP4AIFwvhVask9J0CjhsvtWYB4+gguarOA9HsIs=
X-Gm-Gg: ASbGnctjWPA612Bc6Oe1JayhL2w9IpHuj7c1Wlg2aeoyOrDobZaaA6WCaBScSFdv+Y7
	A2BQ685FtHn0/cdSb3+5ntGMG8cIKsy+XHWOfFvTIE0e8sTWVzIyVy5Bu70LqKu/8yRN/Wdoc7+
	Up/2GJYywmdwCkxIJC+IqDir1+vpNbJ6mhSIS1gledNURHtm4wcWSOZhNnqdIAYRxumXCklG3NH
	iounJTC7BiLDz/YVVcLx/iutVHrvAo0GiW7pq8D8yJbw81gNTFhMajPG+MXhjd9Ww6yNDqMVT9P
	idEzCIPvEz8YQnRj7OoHojchMXad4KJGMyWC9Ooe1VP0JqWIubL0A5Rq
X-Google-Smtp-Source: AGHT+IEKrVqXypAbKMrnTv54YSf/dcmvvAPJzuYbJwPUXuclFLGqTqLof2muT/Jy+9xFYqZ8jwa6Ww==
X-Received: by 2002:a05:6000:1fa5:b0:38f:4fa5:58ce with SMTP id ffacd0b85a97d-38f4fa55a25mr5789399f8f.6.1739928115216;
        Tue, 18 Feb 2025 17:21:55 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f561bee3esm1834665f8f.21.2025.02.18.17.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 17:21:54 -0800 (PST)
Message-ID: <d4c4ecf0-9094-4341-8711-78a48e5d1344@linaro.org>
Date: Wed, 19 Feb 2025 01:21:53 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: qcom: videocc: Add support to attach multiple
 power domains
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250218-videocc-pll-multi-pd-voting-v1-0-cfe6289ea29b@quicinc.com>
 <20250218-videocc-pll-multi-pd-voting-v1-4-cfe6289ea29b@quicinc.com>
 <eec2869a-fa8f-4aaf-9fc5-e7a8baf0f864@linaro.org>
 <huluiiaqmunvmffoqadrhssd3kl2toutqtcw7rzamv3sqdglsf@7lz66x4sj3gv>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <huluiiaqmunvmffoqadrhssd3kl2toutqtcw7rzamv3sqdglsf@7lz66x4sj3gv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/02/2025 17:19, Dmitry Baryshkov wrote:
> On Tue, Feb 18, 2025 at 03:46:15PM +0000, Bryan O'Donoghue wrote:
>> On 18/02/2025 14:26, Jagadeesh Kona wrote:
>>> During boot-up, the PLL configuration might be missed even after
>>> calling pll_configure() from the clock controller probe. This can
>>> happen because the PLL is connected to one or more rails that are
>>> turned off, and the current clock controller code cannot enable
>>> multiple rails during probe. Consequently, the PLL may be activated
>>> with suboptimal settings, causing functional issues.
>>>
>>> To properly configure the video PLLs in the probe on SM8450, SM8475,
>>> SM8550, and SM8650 platforms, the MXC rail must be ON along with MMCX.
>>> Therefore, add support to attach multiple power domains to videocc on
>>> these platforms.
>>>
>>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>>> ---
>>>    drivers/clk/qcom/videocc-sm8450.c | 4 ++++
>>>    drivers/clk/qcom/videocc-sm8550.c | 4 ++++
>>>    2 files changed, 8 insertions(+)
>>>
>>> diff --git a/drivers/clk/qcom/videocc-sm8450.c b/drivers/clk/qcom/videocc-sm8450.c
>>> index f26c7eccb62e7eb8dbd022e2f01fa496eb570b3f..b50a14547336580de88a741f1d33b126e9daa848 100644
>>> --- a/drivers/clk/qcom/videocc-sm8450.c
>>> +++ b/drivers/clk/qcom/videocc-sm8450.c
>>> @@ -437,6 +437,10 @@ static int video_cc_sm8450_probe(struct platform_device *pdev)
>>>    	struct regmap *regmap;
>>>    	int ret;
>>> +	ret = qcom_cc_attach_pds(&pdev->dev, &video_cc_sm8450_desc);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>>    	ret = devm_pm_runtime_enable(&pdev->dev);
>>>    	if (ret)
>>>    		return ret;
>>> diff --git a/drivers/clk/qcom/videocc-sm8550.c b/drivers/clk/qcom/videocc-sm8550.c
>>> index 7c25a50cfa970dff55d701cb24bc3aa5924ca12d..d4b223d1392f0721afd1b582ed35d5061294079e 100644
>>> --- a/drivers/clk/qcom/videocc-sm8550.c
>>> +++ b/drivers/clk/qcom/videocc-sm8550.c
>>> @@ -542,6 +542,10 @@ static int video_cc_sm8550_probe(struct platform_device *pdev)
>>>    	int ret;
>>>    	u32 sleep_clk_offset = 0x8140;
>>> +	ret = qcom_cc_attach_pds(&pdev->dev, &video_cc_sm8550_desc);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>>    	ret = devm_pm_runtime_enable(&pdev->dev);
>>>    	if (ret)
>>>    		return ret;
>>>
>>
>> What's the difference between doing the attach here or doing it in
>> really_probe() ?
> 
> I'd second this. If the domains are to be attached before calling any
> other functions, move the call to the qcom_cc_map(), so that all drivers
> get all domains attached before configuring PLLs instead of manually
> calling the function.
> 
>> There doesn't seem to be any difference except that we will have an
>> additional delay introduced.
>>
>> Are you describing a race condition ?
>>
>> I don't see _logic_ here to moving the call into the controller's higher
>> level probe.
>>
>> Can you describe some more ?
>>
>> ---
>> bod
> 

Here's one way this could work

Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date:   Tue Feb 18 19:46:55 2025 +0000

     clk: qcom: common: Add configure_plls callback prototype

     Add a configure_plls() callback so that we can stage 
qcom_cc_attach_pds()
     before configuring PLLs and ensure that the power-domain rail list is
     switched on prior to configuring PLLs.

     Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 9e3380fd71819..1924130814600 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -304,6 +304,9 @@ int qcom_cc_really_probe(struct device *dev,
         if (ret < 0 && ret != -EEXIST)
                 return ret;

+       if (desc->configure_plls)
+               desc->configure_plls(regmap);
+
         reset = &cc->reset;
         reset->rcdev.of_node = dev->of_node;
         reset->rcdev.ops = &qcom_reset_ops;
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 7ace5d7f5836a..4955085ff8669 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -38,6 +38,7 @@ struct qcom_cc_desc {
         const struct qcom_icc_hws_data *icc_hws;
         size_t num_icc_hws;
         unsigned int icc_first_node_id;
+       void (*configure_plls)(struct regmap *regmap);
  };

and

% git diff drivers/clk/qcom/camcc-x1e80100.c
diff --git a/drivers/clk/qcom/camcc-x1e80100.c 
b/drivers/clk/qcom/camcc-x1e80100.c
index b73524ae64b1b..c9748d1f8a15b 100644
--- a/drivers/clk/qcom/camcc-x1e80100.c
+++ b/drivers/clk/qcom/camcc-x1e80100.c
@@ -2426,6 +2426,21 @@ static const struct regmap_config 
cam_cc_x1e80100_regmap_config = {
         .fast_io = true,
  };

+static void cam_cc_x1e80100_configure_plls(struct regmap *regmap)
+{
+       clk_lucid_ole_pll_configure(&cam_cc_pll0, regmap, 
&cam_cc_pll0_config);
+       clk_lucid_ole_pll_configure(&cam_cc_pll1, regmap, 
&cam_cc_pll1_config);
+       clk_rivian_evo_pll_configure(&cam_cc_pll2, regmap, 
&cam_cc_pll2_config);
+       clk_lucid_ole_pll_configure(&cam_cc_pll3, regmap, 
&cam_cc_pll3_config);
+       clk_lucid_ole_pll_configure(&cam_cc_pll4, regmap, 
&cam_cc_pll4_config);
+       clk_lucid_ole_pll_configure(&cam_cc_pll6, regmap, 
&cam_cc_pll6_config);
+       clk_lucid_ole_pll_configure(&cam_cc_pll8, regmap, 
&cam_cc_pll8_config);
+
+       /* Keep clocks always enabled */
+       qcom_branch_set_clk_en(regmap, 0x13a9c); /* CAM_CC_GDSC_CLK */
+       qcom_branch_set_clk_en(regmap, 0x13ab8); /* CAM_CC_SLEEP_CLK */
+}
+
  static const struct qcom_cc_desc cam_cc_x1e80100_desc = {
         .config = &cam_cc_x1e80100_regmap_config,
         .clks = cam_cc_x1e80100_clocks,
@@ -2434,6 +2449,7 @@ static const struct qcom_cc_desc 
cam_cc_x1e80100_desc = {
         .num_resets = ARRAY_SIZE(cam_cc_x1e80100_resets),
         .gdscs = cam_cc_x1e80100_gdscs,
         .num_gdscs = ARRAY_SIZE(cam_cc_x1e80100_gdscs),
+       .configure_plls = cam_cc_x1e80100_configure_plls,
  };

  static const struct of_device_id cam_cc_x1e80100_match_table[] = {
@@ -2461,18 +2477,6 @@ static int cam_cc_x1e80100_probe(struct 
platform_device *pdev)
                 return PTR_ERR(regmap);
         }

-       clk_lucid_ole_pll_configure(&cam_cc_pll0, regmap, 
&cam_cc_pll0_config);
-       clk_lucid_ole_pll_configure(&cam_cc_pll1, regmap, 
&cam_cc_pll1_config);
-       clk_rivian_evo_pll_configure(&cam_cc_pll2, regmap, 
&cam_cc_pll2_config);
-       clk_lucid_ole_pll_configure(&cam_cc_pll3, regmap, 
&cam_cc_pll3_config);
-       clk_lucid_ole_pll_configure(&cam_cc_pll4, regmap, 
&cam_cc_pll4_config);
-       clk_lucid_ole_pll_configure(&cam_cc_pll6, regmap, 
&cam_cc_pll6_config);
-       clk_lucid_ole_pll_configure(&cam_cc_pll8, regmap, 
&cam_cc_pll8_config);
-
-       /* Keep clocks always enabled */
-       qcom_branch_set_clk_en(regmap, 0x13a9c); /* CAM_CC_GDSC_CLK */
-       qcom_branch_set_clk_en(regmap, 0x13ab8); /* CAM_CC_SLEEP_CLK */
-
         ret = qcom_cc_really_probe(&pdev->dev, &cam_cc_x1e80100_desc, 
regmap);

         pm_runtime_put(&pdev->dev);

Or a least it works for me.

New clock controllers would then use this callback mechanism and 
potentially all of the controllers to have uniformity.

---
bod

