Return-Path: <linux-clk+bounces-2150-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D51DE826E44
	for <lists+linux-clk@lfdr.de>; Mon,  8 Jan 2024 13:37:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70D6D283529
	for <lists+linux-clk@lfdr.de>; Mon,  8 Jan 2024 12:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B66B551032;
	Mon,  8 Jan 2024 12:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZhvIyCH6"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3DA5100B
	for <linux-clk@vger.kernel.org>; Mon,  8 Jan 2024 12:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-557a3ce9942so1129508a12.1
        for <linux-clk@vger.kernel.org>; Mon, 08 Jan 2024 04:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704717152; x=1705321952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=blk0TwokTQ2HtT8cgpJRO0PrfE8+QaeuA8KuyhDefVY=;
        b=ZhvIyCH63z/uWj7keQyAJHzLAR4U/TTAI4k8PCAuEuoHTIzRcHiQV2kg23sjz8tUpI
         336lid2YLy40Jb7toduHkZmVfLPp9gi0UFu1WbY2sgKfRGapiQ5hYJSvSznhn4GG0Q7f
         Qrc+cdBlOmfixZS2bSANfX1LSa4N4attWKgFBXG7IleeofHZfXrw06HbRrODLcXY60wD
         6gh+ekcGRXIoGWTl5S7m+hLPIOp8li3chb9eS9eAMTQwW+mE3R23oxiSLiTgK4N2I4g8
         wBWd4NHauun+9u9MDnmljaLvhCCMGSeLXFSIuHfee1lzE8BweZoW5gfIniiRWKUrC5EI
         X9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704717152; x=1705321952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=blk0TwokTQ2HtT8cgpJRO0PrfE8+QaeuA8KuyhDefVY=;
        b=dozbBTFqiVTl2MV4IxWEFu8vlwj5qZmsefewDNbeLyDOVfPuskUiaxj9YQHXSRPlMF
         knqOzrllVwSd+bMJyrxfXpc1kCcuXQQpWwB3gPqMV+3WYLNq5Z41l6bvcJiu/qpmFSoI
         5tgOX8xVPR6O4Yyn881P3DYuVSdMbcbNp+zb76AjEmh1hi+Zk7/IVN/WiXBUEPAi3EKd
         uzhex42hkKFY2KL0LYghBeat7b48LLvMh0gFketPsEGcBFWtnTBZkkg5+eEeT1xmkJff
         bTYMBduKpRAYxdy7qjDiSbul4J3iYFBdy08PzgOo2rCDpxlLGSCXO0Kxt9szoboNdPdE
         45Pw==
X-Gm-Message-State: AOJu0YzlM4z14l5ta0A/oJ4knldG3uGrOPyt/sOL51PE815O0veM8qrm
	O20hlW1r7KWqun0IYrJCCNLQIhidppWWEQ==
X-Google-Smtp-Source: AGHT+IFasPOg5ZS5bwhv4958GTgErGWcYBFXxfHpHuODvMKahAP/YveDmcVbR4UrtLEujuTrD0tjqg==
X-Received: by 2002:a17:906:2210:b0:a2a:4b04:167d with SMTP id s16-20020a170906221000b00a2a4b04167dmr736131ejs.27.1704717152274;
        Mon, 08 Jan 2024 04:32:32 -0800 (PST)
Received: from [10.167.154.1] (178235179081.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.81])
        by smtp.gmail.com with ESMTPSA id bs18-20020a170906d1d200b00a2808ee8ab1sm3892978ejb.150.2024.01.08.04.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 04:32:31 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 08 Jan 2024 13:32:18 +0100
Subject: [PATCH 01/18] clk: qcom: reset: Increase max reset delay
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-topic-venus_reset-v1-1-981c7a624855@linaro.org>
References: <20240105-topic-venus_reset-v1-0-981c7a624855@linaro.org>
In-Reply-To: <20240105-topic-venus_reset-v1-0-981c7a624855@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704717148; l=566;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=JX51EYp5JFQZ08l/6cPLk6AJNuyWClVT+Ndq0orY4H0=;
 b=Kyn4473DA3WvcmrlK27CvnoOgbeEzf7Yehx2lnAVswUVpL8pCGzd4qG7+r2x3hTw7Gwb/Okt4
 o1nXY+mCXs5BVbXAbVZX26YcwyHtpMVg/aCFQE5UuRkkd5OpcgaiY0g
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

u8 limits us to 255 microseconds of delay. Promote the delay variable to
u16 to hold bigger values.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/reset.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/reset.h b/drivers/clk/qcom/reset.h
index 9a47c838d9b1..fe0561bf53d4 100644
--- a/drivers/clk/qcom/reset.h
+++ b/drivers/clk/qcom/reset.h
@@ -11,7 +11,7 @@
 struct qcom_reset_map {
 	unsigned int reg;
 	u8 bit;
-	u8 udelay;
+	u16 udelay;
 	u32 bitmask;
 };
 

-- 
2.43.0


