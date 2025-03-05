Return-Path: <linux-clk+bounces-19005-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 546DBA50DF8
	for <lists+linux-clk@lfdr.de>; Wed,  5 Mar 2025 22:45:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3247E167495
	for <lists+linux-clk@lfdr.de>; Wed,  5 Mar 2025 21:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3B0825DB0E;
	Wed,  5 Mar 2025 21:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uqGTPnKb"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF68125D910
	for <linux-clk@vger.kernel.org>; Wed,  5 Mar 2025 21:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741211053; cv=none; b=tvxxZGc8gjf36azxFYr0OBU4ecWBBuA/XQhKTjRLMosNSsuniPP+uFYa1nF4AxIA0LRDZlSJttda8wt9tfluYLOkj77B+z1QRZiLgY07n+QEubb5eJLApARqIXBnVspwoIgPdBLznXmoMptLn6fWWATKyiGwyz7e2HJsbPRWWQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741211053; c=relaxed/simple;
	bh=t+zGz1MJJVI0DC4qjJcqN4r/0vYG3vwFfP7yta9kkmo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eEFm1WqD6MLNBJBofhsvCtmJJEY0VjWBgyBaVXxY+bDOr9a4TnnZ4CH097sPBZwfxzeN8OY8w9iIHM527FPuHc5bjrCIEFVVSgeZp34B2+J1jzKE3BnL5GGJixqw0DjCp905XzcLu12aky/EednxP0Obt0tiFrfl43HUGZS08xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uqGTPnKb; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43bca8cabc8so3521605e9.2
        for <linux-clk@vger.kernel.org>; Wed, 05 Mar 2025 13:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741211049; x=1741815849; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nVxGAM4/nCcKxs+sDtsismmOkEJcCWSQ0DSMt8DbCic=;
        b=uqGTPnKbHdu5UCsKzZni90Heu/upORA0PNF0Hfjn5M9wKYeyYQU1V4n5lAVTQQ0qmi
         AJK/usTs4sHZrVMkU+c5+R+PWYUdY432Sz2f8o6J22m7huKWJ5XqnRERdfoMAgOfyFQ0
         VpvS37XiDkqpLZlOPXqKbFoNez/xwaY6xR4v15c2olmpTo47S66BZ3maA/p75rjFOmOX
         4438fakuzs4ZuL46Sj7hll3rqaylQ9z0eQySM7LnNYQ5JuBqxV7HQnwhpDZfQAO+69mu
         PP2yydi6QgprPNX5IeX5XYC2eIG0YlmORIr0DHURf6mmzZjeys7DuDdMqhUd1WKlME7W
         azYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741211049; x=1741815849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nVxGAM4/nCcKxs+sDtsismmOkEJcCWSQ0DSMt8DbCic=;
        b=CQyPAR14yTPco1hY9crimujeNVqqRG1yhv/3BANozJ63zVK73XMze5sRJthcAoB/ez
         nj9omSJtmnMBBcI+FCn5023FJd5IxnnPK/0efMwQmSWY+hStWkcFhVoN2PVSkJc6JBMn
         teaNXkFGnvgdrl4syEMe/kawovX2NT08gDH1FjvWPoeolahDUJsPtYR5ETW1yhH3SHxh
         /iSG/QEFlY3rxhwplRGHPPCOBWOU2Z4XMRPMArff93BHtRhiQaDfWvQejPDAzucfW8uf
         tzFZeBXNUiwxMwX7Uu7KfduXgwOP8QYE2xZ/2NAAOoZ3krS34jj8Mhy0q8E/YiBQm2rM
         aOlw==
X-Forwarded-Encrypted: i=1; AJvYcCWB4runNJUDsHG9kjRLZUKHVMbC4fp+jLyVlKKXKjtp7PoR95+wV343EcqaSfbXf6oPZ+eSES32pvY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhl7tgB+TYn7LC4UvzYhWYzhoSu3qRVMSMJDYGcaGScfg0xuLe
	kZdoDU3lnYbpSh9EpPrPd2syvjxPDjvfrCyxKpCx2Thok9JASqYojtmxavwxa+X7mg8DGmK3rA9
	6uCQ=
X-Gm-Gg: ASbGncs4BpF2S74Mx+8FNUxCxtPyYl2VN6YXjmWrmax7WUZi8TOZSzvX+EezxkPRhwQ
	QpqsJIbwWOJ47BmKfxO5rgNumgn1K0SOOMZeBU0+WCIHMomM+T+jVqVO5QLmCqbR7vI8FPUtiCW
	dzIbI3wMTCUJ3po73Wi1TwQ8dTKTtDlfobwf5eYrtkRgbE0fMceIT5/bGiiZmeXm1dxDDMPUdGO
	k+imKaQQhCUwe/YQN8vR3nzaqmOyqlHkUCvWg1xJkV//MvIgsZK3KJC6CXjr8rqlaq0jwblhH83
	GJsE/br8xyKosO8U5Q4YkMsqgZqiWeGm0dFCvxrz8gJPzDRuwHKSGlheMI94
X-Google-Smtp-Source: AGHT+IGTJpI20ihfkqPuNjdEmzB+MiUW31b6PxusuYq5eKUNbKdBy8bsMW4AkAQoRAhs0uUmLcziug==
X-Received: by 2002:a05:6000:4011:b0:38d:b090:a0c4 with SMTP id ffacd0b85a97d-3911f7ae687mr1551301f8f.10.1741211049635;
        Wed, 05 Mar 2025 13:44:09 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796517sm21954802f8f.5.2025.03.05.13.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 13:44:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 05 Mar 2025 22:43:37 +0100
Subject: [PATCH RFC/RFT 02/12] clk: samsung: exynos4412-isp: Use
 platform_driver_probe() to avoid __refdata
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-clk-samsung-ref-init-data-v1-2-a4e03a019306@linaro.org>
References: <20250305-clk-samsung-ref-init-data-v1-0-a4e03a019306@linaro.org>
In-Reply-To: <20250305-clk-samsung-ref-init-data-v1-0-a4e03a019306@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1645;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=t+zGz1MJJVI0DC4qjJcqN4r/0vYG3vwFfP7yta9kkmo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnyMWY9A8xapFqDHqyFPngwImNfotWJ57AYEudX
 R+YhiTFllSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ8jFmAAKCRDBN2bmhouD
 18frD/4wNJJk95A4UmdSvfcwkDL/IZxRyGMwQlmE2dQ0eNLXUj3pmzb5ahYb5qSm3qswa+ye6JX
 x58thWUBbzzrQticpGDE3e1JycQL0PqtsQQk6uuc7KT1rDINwiK3Wjzb6wCZiFgnNEQAhpbobCL
 IiQ8qdle+SDL5V9icLdStqDDLNl9uaJCaS7OXQWzAEtX0N/0ymCQcJKSwWdHGMtohiN77P/oeUu
 bAbqRNgZKw0UkAy0LvNI1u/Q8kpvXhDtSdOByTvLQbMuNVH1qWVbYjEOa4ZoftZDKBjXOoZFsYv
 jq5T+2x5ZxkGrUaxsf3QwgqAVwyRGCUFHebZKZ679wt9riyIl2N121NWkYhvmwMnVNCLJpkfj6b
 m6IowacIIQrN+UXNEi2Ubh93DetlFeLDXXkcr5j0vLDgBtq/1GmleHwm4+n0vFcEWh4K6gLqBCk
 5CL+s3pc7HTwh6Kkx3prKwpN+awIVybjKKLb6L6PqiMUC8fKKeZw5UJqNuG2uRMdQrcpGncL9IN
 Q5L51z0+x9/g4r4Adj2cxZX3ePMtRpqb8MGtOU1I2/thJIe0vofagNe4NjNcfJm/STiP35FWm8x
 LfBANRztSiEN/z7lLowXbGto+SZSJ8XteiwMQHiKTZXecM9Lm9n3QSdePqgWYz6n+WxKH9/O+4b
 Tc5UFPKULXewf2g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Switch registering platform driver to platform_driver_probe(), so the
'struct platform_driver' can be properly discarded after init and there
won't be need of __refdata to silence DEBUG_SECTION_MISMATCH.

The change requires using subsys_initcall instead of core_initcall,
because no device drivers would bound in the latter, as required by
platform_driver_probe().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/samsung/clk-exynos4412-isp.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4412-isp.c b/drivers/clk/samsung/clk-exynos4412-isp.c
index 29c5644f059379f8a0770ce2214c32b9df7d76e3..f288c152d3f769fbb5123c3b79fe4ddc8c23aa55 100644
--- a/drivers/clk/samsung/clk-exynos4412-isp.c
+++ b/drivers/clk/samsung/clk-exynos4412-isp.c
@@ -155,18 +155,17 @@ static const struct dev_pm_ops exynos4x12_isp_pm_ops = {
 				     pm_runtime_force_resume)
 };
 
-static struct platform_driver exynos4x12_isp_clk_driver __refdata = {
+static struct platform_driver exynos4x12_isp_clk_driver __initdata = {
 	.driver	= {
 		.name = "exynos4x12-isp-clk",
 		.of_match_table = exynos4x12_isp_clk_of_match,
 		.suppress_bind_attrs = true,
 		.pm = &exynos4x12_isp_pm_ops,
 	},
-	.probe = exynos4x12_isp_clk_probe,
 };
 
 static int __init exynos4x12_isp_clk_init(void)
 {
-	return platform_driver_register(&exynos4x12_isp_clk_driver);
+	return platform_driver_probe(&exynos4x12_isp_clk_driver, exynos4x12_isp_clk_probe);
 }
-core_initcall(exynos4x12_isp_clk_init);
+subsys_initcall(exynos4x12_isp_clk_init);

-- 
2.43.0


