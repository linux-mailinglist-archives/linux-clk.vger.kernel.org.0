Return-Path: <linux-clk+bounces-2424-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F51382CD1C
	for <lists+linux-clk@lfdr.de>; Sat, 13 Jan 2024 15:51:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F6C21C21416
	for <lists+linux-clk@lfdr.de>; Sat, 13 Jan 2024 14:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C680382;
	Sat, 13 Jan 2024 14:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yf04sLoI"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985021849
	for <linux-clk@vger.kernel.org>; Sat, 13 Jan 2024 14:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2cd703e9014so59668761fa.1
        for <linux-clk@vger.kernel.org>; Sat, 13 Jan 2024 06:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705157458; x=1705762258; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XfDCSXNar/0OypW7xIXC/SzvfN+SSQCc1nv247H/a24=;
        b=Yf04sLoIHc7nj3sRv6zRciRjQbyfh19sv9ZGkt3b4PgNz7uR+3iZ1iWIvCzaSwu0aS
         t/zpZ0BUsgucv9rzI2PWblf36K2Q37vcnl4v7y/DmEuRCZHlC/Zjjy7lVfjhOEJsBfMp
         ovlXjKOZRglq75RebK3AimdFSAObRpbrKbOPTkMR0JwVn8zShLYDhotKKlfITTCOIP2l
         vJHc7F0wDthLhszqlFVZN87fO1o9xZmNoQYqceUKk+SAzTrd1t1I8HPu8VwWicuxok1m
         HXh9U0bJ3W0wU1aML25jZFH6zh6jHSJkBJvHynioKfXAt6TdaSsCKEJE8B4wk8KAJlVr
         ct3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705157458; x=1705762258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XfDCSXNar/0OypW7xIXC/SzvfN+SSQCc1nv247H/a24=;
        b=l8FUOoATiJym9uokjDpRF7BOG7hMzxLWhFadsTSuRf30ECcnGq0LaQpq1C9O9pkNvq
         WVqKTgpQ4FubQ/njOhM2arP8jn3OLlgvnQNeXBczKW8dKOTckOoSsX7nYBuAQ2rcQpWb
         5KKYcqUrib7xLCKoR/68+D/o2n6rA/epQQLByeRj6DOfbD2HfSytKM2E7Cvsy/WicI79
         tZ1TBzkaxOSGReAgXWSg/FtujHbzMEu4DBSxllWUlQimdwL2XGzOemlPwQZ+sG7bM97y
         7VQzPSPUNc3/8XRpXBqSShTqrQrNG630SiWWyQNiYb/AABE58DImuPATNF3Bt4powtqK
         n7ng==
X-Gm-Message-State: AOJu0YwirNomlvY+nJgH8mztHcvBgp6vn3LRosP+psIS58kPokByacTq
	n0btbvPgcRW1wFrofl2Ws1cHKCl31f5zyw==
X-Google-Smtp-Source: AGHT+IGp/zfGDbyLU8PR37bhpdIczUgw5xA/ucpaCuOwbOBmWX7Uhq4uJUNaePB14yDEEGVjvO5gGA==
X-Received: by 2002:a2e:9f10:0:b0:2cc:f586:ce9a with SMTP id u16-20020a2e9f10000000b002ccf586ce9amr1565995ljk.93.1705157458658;
        Sat, 13 Jan 2024 06:50:58 -0800 (PST)
Received: from [10.167.154.1] (178235179017.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.17])
        by smtp.gmail.com with ESMTPSA id es18-20020a056402381200b00554b1d1a934sm3014593edb.27.2024.01.13.06.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 06:50:58 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 13 Jan 2024 15:50:50 +0100
Subject: [PATCH v6 01/12] clk: qcom: branch: Add a helper for setting the
 enable bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230717-topic-branch_aon_cleanup-v6-1-46d136a4e8d0@linaro.org>
References: <20230717-topic-branch_aon_cleanup-v6-0-46d136a4e8d0@linaro.org>
In-Reply-To: <20230717-topic-branch_aon_cleanup-v6-0-46d136a4e8d0@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1705157455; l=1413;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Bhpm8sfSCBACZPHOO1eUmAv4id2tp/m4vWhfhP3T9EI=;
 b=U8t99OE+nuQKV/KjR/tksz8wIitl5avD9kp1LgyS4lurH3E9MqzA2JPAXGXRDJX/IDCa6cSd6
 SaAx0i7QOGtDyUV5qS112GadjQlq3T+qOYNNNfQuNbq0DpfgQzc8Sk8
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

We hardcode some clocks to be always-on, as they're essential to the
functioning of the SoC / some peripherals. Add a helper to do so
to make the writes less magic.

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-branch.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/qcom/clk-branch.h b/drivers/clk/qcom/clk-branch.h
index 8ffed603c050..0514bc43100b 100644
--- a/drivers/clk/qcom/clk-branch.h
+++ b/drivers/clk/qcom/clk-branch.h
@@ -64,6 +64,7 @@ struct clk_mem_branch {
 #define CBCR_FORCE_MEM_PERIPH_OFF	BIT(12)
 #define CBCR_WAKEUP			GENMASK(11, 8)
 #define CBCR_SLEEP			GENMASK(7, 4)
+#define CBCR_CLOCK_ENABLE		BIT(0)
 
 static inline void qcom_branch_set_force_mem_core(struct regmap *regmap,
 						  struct clk_branch clk, bool on)
@@ -98,6 +99,12 @@ static inline void qcom_branch_set_sleep(struct regmap *regmap, struct clk_branc
 			   FIELD_PREP(CBCR_SLEEP, val));
 }
 
+static inline void qcom_branch_set_clk_en(struct regmap *regmap, u32 cbcr)
+{
+	regmap_update_bits(regmap, cbcr, CBCR_CLOCK_ENABLE,
+			   CBCR_CLOCK_ENABLE);
+}
+
 extern const struct clk_ops clk_branch_ops;
 extern const struct clk_ops clk_branch2_ops;
 extern const struct clk_ops clk_branch_simple_ops;

-- 
2.43.0


