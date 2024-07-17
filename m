Return-Path: <linux-clk+bounces-9730-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6EB933AB4
	for <lists+linux-clk@lfdr.de>; Wed, 17 Jul 2024 12:05:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAB351C20ACF
	for <lists+linux-clk@lfdr.de>; Wed, 17 Jul 2024 10:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2636717F4FE;
	Wed, 17 Jul 2024 10:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mVf71atw"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6408917E8FA
	for <linux-clk@vger.kernel.org>; Wed, 17 Jul 2024 10:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721210677; cv=none; b=AF0ozgi0qNT1ykUWzDecb5co4WS9GEZ1KGyH3kc1VqzE3ZBhs8EvIHubTQeDiz9A6XkADoi908ttwj629sAbmBcJfzgXs63rJjHRPKz5+rcorKxiYQTU7Qj8+OtpTrTNR2Wynzben2zBrV9WKSvWZGKtkDyE3M1TpAu11mcesVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721210677; c=relaxed/simple;
	bh=wQPDZecThJ0QE/52S/uvkRWyKAxX/st0WbQoESm9OOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pPdafN+HwlaLyATEPg0xvPAtPBJL8xZ0PYfWUKgeR2azuUtHTdTdAUW+jPhQQ7nGGPmy2vq3UZMqotPr61bADxM80gx3Bi45uUq+sO2I8/3u3/6c2sTMAQUz6ZkGbnXwMaDUXPeeGhY8tMxnBYrbqae77MTLb+TPVqBLfIs8zsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mVf71atw; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52e94eaf5efso8377586e87.2
        for <linux-clk@vger.kernel.org>; Wed, 17 Jul 2024 03:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721210673; x=1721815473; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zZcwb+lCyaWufRc3w7ZSgOpwTYaeg2vNCoDhk5BSp10=;
        b=mVf71atwqpyfRm0R6hgqk3h7rzjBwisYRzTqL4uZUwFhx+K4EEpGFzQ0BGyV4J+NsJ
         eLpBzR9+uPAMgA/FNH7hIKsNFzckCAWAw52LJI7Zh8CV/sm7KuNHbhJd4H7aQDflt1xS
         eWB3JY4/NuCO9JGEYOZoavkfUxFVEmLs4k1S5eeQ2I/FYAbxYeAK/+kPB8oWRurE7HcN
         N4DNnJL8K+MkzP4OqlEcZCmI402KdgAo5ildyUizno3+RKZxSpa1m9pFNQB6+30uA/WE
         nLfmxvQDTBqD/FMWD6lsBxODNjJdJvzZN0W7uBnifD2Tq25Xne0/HnkyA7Kyqa1xABji
         zHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721210673; x=1721815473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZcwb+lCyaWufRc3w7ZSgOpwTYaeg2vNCoDhk5BSp10=;
        b=YGKX7edH2l33UpkQiIltwRdWPP7BrmlxfgX+cHy6kUQq/W0n60KMf3WNofTqmCalDr
         +enLQpcMpQrwPMDttFEu2RSIGaHhpgTZN8IYIxZ2vPMl0DEHCjaDsUzCIOv/aWg53rb/
         Ym+stQDDzP/CvTg3riKW9PNOTXkQH6DyzP5mTyog7g5vgoz60FViVpCS5XPpA9IQT235
         qf+bn944yzUUiWgJTMuFHFvqU/6takUGVLcEVSQQAOnRY9b9jRzWRhw5kNjBiC7SRxbp
         zQb1XPmEVxxemj18n0i9f4H4rzDU31G9O4oV9mrTbhtrVEoMwUBlMYTDQby3ChLeiUBq
         NVZg==
X-Forwarded-Encrypted: i=1; AJvYcCWLZrUiiRhV2y++StzB9lieGwaCEIkxamc/I5TNn71WUb0DxwQ5rb15VkkNz/lpPk9JdsbqX+h2v77CvK85tfh5hi2hcF0hOs+w
X-Gm-Message-State: AOJu0Yz/t4lArnvdar25wDmtSkKjFg3od9T06il9IHOqPvQB91DQryPl
	YIKiT6nYm2aUsOAwRNwZNIlJlSX04HJU1+6DJ4JRLG2MD3KK2u/z6NPrcg5wDUU=
X-Google-Smtp-Source: AGHT+IEV+h62eInYcVlWZ7oMSsbJX+CSa4FXLLM/ctwPtp0LN7+OdwZNKMMNR9mTjdc4LTflW8klqg==
X-Received: by 2002:a05:6512:3090:b0:52e:9808:3f50 with SMTP id 2adb3069b0e04-52ee54113dcmr919648e87.42.1721210673348;
        Wed, 17 Jul 2024 03:04:33 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ed253924asm1425391e87.262.2024.07.17.03.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 03:04:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Jul 2024 13:04:29 +0300
Subject: [PATCH v2 2/7] clk: qcom: dispcc-sm8550: use rcg2_ops for
 mdss_dptx1_aux_clk_src
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240717-dispcc-sm8550-fixes-v2-2-5c4a3128c40b@linaro.org>
References: <20240717-dispcc-sm8550-fixes-v2-0-5c4a3128c40b@linaro.org>
In-Reply-To: <20240717-dispcc-sm8550-fixes-v2-0-5c4a3128c40b@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=830;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=wQPDZecThJ0QE/52S/uvkRWyKAxX/st0WbQoESm9OOE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBml5ctF4GAWlZT9rLRajV4/Nk/txuU5j9SbkjBo
 HND3kbVpZyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZpeXLQAKCRCLPIo+Aiko
 1VffB/9eU5hIQWfNr6r6XZCv1yqZBIcE5bQxTHsAjgY7LRM2dxHx+lcqT4ABB/AJnhIwEnGRiSh
 D06IhctHRq34APciRzREbaDfMxyUUAMUJjgrWEhBCMczIUGBIFq7Fm8J4BYGJQ/FfuBPZNqP0hi
 w//VvSMfkAdp3b+JwDqVvShcd++LkCKj8XIGeR2t/z3MZLHgmQuUh/AN9C0kyBf4deqf6QwcWUk
 Hxp4lhO/VtpLtuiHIBnE5E/fj2J7UA/597WxIlZjyfzpdgpdWQRZmtoIwezglf5V7kIsdmd91Z/
 4PaOG+qgkxkFJYpilbfHhz7HTNFSf1aQSdtz8N+xASfauS14
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

clk_dp_ops should only be used for DisplayPort pixel clocks. Use
clk_rcg2_ops for disp_cc_mdss_dptx1_aux_clk_src.

Fixes: 90114ca11476 ("clk: qcom: add SM8550 DISPCC driver")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8550.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
index 954b0f6fcea2..a98230540782 100644
--- a/drivers/clk/qcom/dispcc-sm8550.c
+++ b/drivers/clk/qcom/dispcc-sm8550.c
@@ -400,7 +400,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx1_aux_clk_src = {
 		.parent_data = disp_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_dp_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };
 

-- 
2.39.2


