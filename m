Return-Path: <linux-clk+bounces-2867-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F2783BD48
	for <lists+linux-clk@lfdr.de>; Thu, 25 Jan 2024 10:29:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA1CD1C23921
	for <lists+linux-clk@lfdr.de>; Thu, 25 Jan 2024 09:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31DCC1CA95;
	Thu, 25 Jan 2024 09:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hmDtWrBy"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C25C1CA9B
	for <linux-clk@vger.kernel.org>; Thu, 25 Jan 2024 09:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706174891; cv=none; b=VFVhm1mF9w18tBm8pYTLHQibxUpBt4JuAK11dmga9vQQH7maX2+KEJF0ye1STWULf7KODvFtrxN3FWCYtu7/lzYH6+rmyJ+8i1aefZiwN8BxMkq99MCINRJJSEjPrBE/7Smp+/Fd9Yw1QSsz+k1MLJnlvDhVxtz/CWgwxAxUqTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706174891; c=relaxed/simple;
	bh=vM8sAjWAZdmpMApzUnKAm7BTvnMQ9KS6M6m1MOE6Rz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EN45/VfWGGc8fKsOpm3rvLHNKeEnrpD1+k/hZW68oLoKkVQzSfdK1Qm8aSpk9G9b4hcY22X1WzAW5QmqeSSOhK1jJZXgPye9vo8OX1OL9uiTDtsxik5oMrQPrXkVUF3VerpIZmk39N58Qw8lYogzg2dS2UAMrBM9+ifThoJDATo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hmDtWrBy; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-55cec718c30so839627a12.1
        for <linux-clk@vger.kernel.org>; Thu, 25 Jan 2024 01:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706174887; x=1706779687; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JTwXeJttr1S5lj9FfbVYYeUxM0hcJGZds3WqL24wOLw=;
        b=hmDtWrByeZ1Y7aHhWh53vXNQb7XD1U7esmPtbC/fNXqxn1IqDiqmKjX27OURDTQboc
         3nhaxez3+jZciYvC8KAMbI3dUDHwfoJczNO1RPshF6+eep5ASx4b2fjKkTZgbwhfX2Ao
         b/xZN5aasbzvCCCYGetYZluD1ZqLh6F4a1gdUCIHnplhDmSqaq+M0lQSRZtLXyvJsUAV
         uwR7w3y0P7Q18nCOXkb6LauIqNr1cET2cGJBiKpGStt/OMU4xDxfvxk+5bGPAO74qagN
         DY94eH+n5OXrB9neC0MmK+yxoUldhCb1hCm6oYQ1jrzHNt51xlZsCHDRDJcHc6Gwm778
         psXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706174887; x=1706779687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTwXeJttr1S5lj9FfbVYYeUxM0hcJGZds3WqL24wOLw=;
        b=WJmtUZzy+mkH8BcU8jVGmjx9xpmHy6G3f4nDQPMDS4gSdh8RX+fbPGkJn4/wkWdSU5
         /TpHhw42tAMxdM5vZlBUR50RTGLPrYbf/pZqelnv+CTwTcVKxzOcTgCtRNI4pEYaX53p
         9tNI4hHMVaeLRXG2HfyTkYIYtEIlROVKXgPA1X+c760FYlhPoQAjdSVRytNeFOlQlzLE
         ntqRjpDtJTfV8gxG0IxSvsfv8Na4puj8WHayn6a5o85UuYfqyd6gA0P1TKiByLMVmSjz
         szyEQyG113cDjMBxKTnMWLcyCuyjxC/axjOeJQjWaJwbU+geUdTbMnDBuLtR+8LQQRq2
         sFPQ==
X-Gm-Message-State: AOJu0YzpvGH1XFrOvvcr+YGV32ypwUj2mQW/btPxQcU/NeEfLc6TguWA
	K0EmoxgiYcdkVLQ/ByGh4BZD+xaq4US9DT8NYtVVtEUVYBZL1wWoqdknw5sMPR8=
X-Google-Smtp-Source: AGHT+IF4STyFToBkXX9Qf3dstQgW+j+GfF6phsrITwrpWr26gqU3SVpWLw58fThxoUw+27T3eqFPkw==
X-Received: by 2002:aa7:c55a:0:b0:55c:167:7206 with SMTP id s26-20020aa7c55a000000b0055c01677206mr376941edr.70.1706174887615;
        Thu, 25 Jan 2024 01:28:07 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id f19-20020a056402005300b00554af5ec62asm17356391edu.8.2024.01.25.01.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 01:28:07 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 25 Jan 2024 11:27:48 +0200
Subject: [PATCH 4/5] clk: qcom: dispcc-sm8550: Drop the Disp AHB DT
 provided clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240125-dispcc-sm8550-sm8650-drop-disp-ahb-clk-v1-4-0f8d96156156@linaro.org>
References: <20240125-dispcc-sm8550-sm8650-drop-disp-ahb-clk-v1-0-0f8d96156156@linaro.org>
In-Reply-To: <20240125-dispcc-sm8550-sm8650-drop-disp-ahb-clk-v1-0-0f8d96156156@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=677; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=vM8sAjWAZdmpMApzUnKAm7BTvnMQ9KS6M6m1MOE6Rz8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlsimeaXC4IQaaqMFuSTI/X6sHoHCXKySS2ZZwc
 Y0U0qsRcVKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZbIpngAKCRAbX0TJAJUV
 VpG4EACXx2zpzkgGrpHYlxWC5e88R/xH4b60vUTfMKBaFuImspeeGadj/XwL/QuYYsERJUSA0iX
 zleQXXSnaq0LcPHG1HVDcMPorHotyHCRORKKDwhvuJpbx51pW9Ikwa6itvtziyYoJw1wMWWywxb
 /hJxYFr1dZyXyTJPLtipK59eGRxMhk2zYmDIm5ndz/IGG1UKaSlSzCG0zFEFqzA8copr7HYldSd
 HLTGnN9ziC2VY5LPiv1cOfP+UzZQ9c1Lzy/uxXwJ5EpNS7EaTh6AghUgVbofeY7PIm3IdSEZKPH
 lTbA2WOWgAJqt38KjIcW0l6QqosfYlElFJsGr6vIPGad16NLJnXsDFVWfg8A94o8yh1K7UQa5g2
 DEXe+oqDg4gXsAzQM8HzO5RcPu0n2/8xG45HdaV/+BFv7iPmSTx6UQvgrlns0KpLIEIfbHSWKp2
 XHnZz+XVvJiF1wRJ6GMFssfsthq0zMSnmRe/OJgElyIgSwBg3LqmT1c/N8e207wwf0waxS9bf4d
 XI4BHql9ntxAqiNQiMlohCm58L6US5rZYcTyAQdvxkot2CI4HmkUNyM2M+pgLUG3DbPfIt/ydNN
 Z5bU5WoluSr+oqXgVDiCheqFHqIteEU9Ma3y6foCYQPWvLva7OZnnjIbr6N9EUeJLcA//GW8JCg
 claAHhOiVsm3vdg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The GCC doesn't even register the Disp AHB clock. It enables it
on probe though. So drop it from the list of DT provided clocks as well.

Fixes: 90114ca11476 ("clk: qcom: add SM8550 DISPCC driver")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8550.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
index f96d8b81fd9a..b33795f8e8cf 100644
--- a/drivers/clk/qcom/dispcc-sm8550.c
+++ b/drivers/clk/qcom/dispcc-sm8550.c
@@ -31,7 +31,6 @@
 enum {
 	DT_BI_TCXO,
 	DT_BI_TCXO_AO,
-	DT_AHB_CLK,
 	DT_SLEEP_CLK,
 
 	DT_DSI0_PHY_PLL_OUT_BYTECLK,

-- 
2.34.1


