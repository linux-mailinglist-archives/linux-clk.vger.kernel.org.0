Return-Path: <linux-clk+bounces-19013-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 248BBA50E0E
	for <lists+linux-clk@lfdr.de>; Wed,  5 Mar 2025 22:46:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 531851888665
	for <lists+linux-clk@lfdr.de>; Wed,  5 Mar 2025 21:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9FA926280D;
	Wed,  5 Mar 2025 21:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s7LNa4sk"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F61D261586
	for <linux-clk@vger.kernel.org>; Wed,  5 Mar 2025 21:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741211070; cv=none; b=AUWh/ZFF/BPuvaT+z6QOZALDBarYXLzW0HDyqsufLhVKdWcwGLpemBnUShclwKFQ6CjjIK9qLV+nKNUaCgBBcFsXz5O+SlUSDAsHoGDO1prr8eV2WYoTknd+x64vsz/FPqZH6UfDCyDlnsV5dpCFosLDU2SFc5OcFK/fQTo43Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741211070; c=relaxed/simple;
	bh=+mdLo+RkoqRzAL/WYhvT4QEnTkohQ3q1+qBv/V7NnpY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cuxRx3SrmBSfN2KtxcVDSc94Zkx4DBcVkU5KH9MJVE909HfjU1fNHwmfbY+/KnkED+XNvv+cAp6ZQNjiKSKThOxFVx3fwFvyFdUUJCxvDx3pBK5SW+woanZOZZUMRLnbLoug+Udo+btWOTObi5dv0bC3HzhSgqfCow3rtQMyXMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s7LNa4sk; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3912622c9c0so78113f8f.3
        for <linux-clk@vger.kernel.org>; Wed, 05 Mar 2025 13:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741211067; x=1741815867; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1dWFaS/G97jqWOxgFqeYAXV1zne3+Xl42M5FVRGuZE0=;
        b=s7LNa4sk8mghsrzpBOGu41KXn874B1DwsiM0nxjuyWotYwddemuKRT+SoGwEpvFjJz
         Q8ckErhWCYVQETPVu7aNjuiQY1gtUw7MBjFcsK08wr4ZPFHoam0hsMxQANSJrBW6m/aa
         /cboJxPQPrLHnze6xuivkYJ9MkBp++yMw3u+xxVh+bITPWN8VJ9IP5tF3EXlz/sUW9lU
         SL0diV6sOfNEEO1rbhtQIoChJvH/15LwE9VCWLYJgeuLBDFg3ny6LxauVCFWYQyJIEx7
         qEzQ8CLVm2Qs5qsQxKtDM7aBzBtdIZ81JsAiiLCsTIHWVx620V712e0ZZ8PQSP65qWiL
         RVmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741211067; x=1741815867;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1dWFaS/G97jqWOxgFqeYAXV1zne3+Xl42M5FVRGuZE0=;
        b=xSg2wStBv95ip4zWrEorr9ND7gq6/yqHYx/1gwTq+mtX1LEPqx8lwhM0lcRATlOBHq
         oLzfgRR0OXJmWdUvQ3cYEGDQoC+4XLQW3gOjku70f95qa+DOSIooIQbKkqqLGhQurf8C
         zidPyQ7nMepv1DA6K1vpFUhpwJm2whA0O2QQ+xePudRmLfTa+VhzXC+Jm6wpmofffF4l
         IzoQkGsh26S+VsxEqy2TtBBMuViPyLeC+DDCe6K8qBVkb6Axdauq4iudY9SBQsbDqE9s
         mXsI4mIvrtuUdLe2GtwFShVOQu/l8fBa4zeC5g69DsBmU8IwZaE/C/+myiM3Z4eW+v7d
         1xrA==
X-Forwarded-Encrypted: i=1; AJvYcCV6uWN2EoEhwbBA605C6V6L0BQ0VL8828Viucdce1zX8RExyjc6e6hWxfaZMHqhh0SlstCRmOyUVOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIajMXdTNqWonJP32VAQ/hbCSV+2wg/fpYFwuOT06GgZhtwOFq
	NUDbCIYj2kOLQBA5uoeCxd5UOpPlanuTPCnTPZzVL6ugK/I1drfyFSren7QECu3m2L+dzyHD+t4
	uLpI=
X-Gm-Gg: ASbGnct2jGoqnNyh6gZ828v+dWQMWhyau3hEsUfQ+3uu2o4Q0dTA7OW9zzWi/NfTU7M
	v7Gy8aS36LxpPBUrnrz3GHb/ZUQRvmbgVNHTfUbOezfYqJlsWQNrpZQhosjw4x0QFj/b2tNIGQ9
	d1EPNBgrBj2dTQEX7EMvVYwBG5pcgPHizERFsiPXRh/VD/wPgXSnKWxp870NcfR8o1rrmdirTtY
	aTsHMKimzQ3BH+WDTMD+kjfPhVYJLOAZoCfgUR681NJQuQFRuyPV1o50/U5KIEmq1ZK4hfX7WhF
	Kywu9whkIpZkdLblzhg899nK8+XUIaeGVdVB88p8SMfL4zQA6S1lg3vPlNDq
X-Google-Smtp-Source: AGHT+IH1A/fJBTLHqlPv58KQ/cRH/6Zi6XKboH22bh6sg1obd9fls+egjcU6yo5+Sk7gg6ScTJLpeA==
X-Received: by 2002:a05:6000:2a8:b0:38f:2685:8457 with SMTP id ffacd0b85a97d-3911f590623mr1362159f8f.0.1741211066682;
        Wed, 05 Mar 2025 13:44:26 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796517sm21954802f8f.5.2025.03.05.13.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 13:44:26 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 05 Mar 2025 22:43:45 +0100
Subject: [PATCH RFC/RFT 10/12] clk: samsung: exynosautov920: Use
 platform_driver_probe() to avoid __refdata
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-clk-samsung-ref-init-data-v1-10-a4e03a019306@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1594;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=+mdLo+RkoqRzAL/WYhvT4QEnTkohQ3q1+qBv/V7NnpY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnyMWfD4lNE/n7846a4TZs5bMvO6ZP27EkqCuzU
 G97+bdTSAWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ8jFnwAKCRDBN2bmhouD
 12U6EACKb7XaVg5lIb8YLj4xomObRFocfsUu5p6GcY0JzCGxUHBy+VYR3ckEhH1TzoELWHBpXMs
 72ZsEG+KN1VLnqTrf+gzGLKULXDBAFZAwRS+WYdrmVQjIhzIvLjPidyGpIcSbuMQKjBIoKVSzGu
 /ruK0yYNw9RX1rdShrDg25VfSn0zDm3zbhAEOIAUnf1Yt9OH9N49fOyH9s5HlEIU0W5D+4C4p/v
 ejClar7kt4g6Vjo5sp1DiviOKQ/yelmcM4qaJW7MosgUOVyc2UF0rn7eEKtLphUBOXZYbZLjO4A
 lQ346iWlNvp6pfxlYG5GXyKIOn4lnsDNPSgkeqKxaWJ8HRMwboir/4lUfIO/93c2VJXU43lz8HB
 5lR8cAaS1x7NeCzLJiuFg4vd8SsifJQN/a7ilPPKfaIvyOQyvqrbfzc7arV7DVI501e1hXCm2YH
 NtNB79aOcFO5pAol/WpmnIjSjuoIsdNZ7oPo4zve1XyBNnJ8EUFyld6IbL7ikHZ1m5sOVjkY+Eb
 PZc08yr/d8pPc+4IncTUhrHFDMQrJEf1ng0lLMJTEn+2yXkJFfqw1cR2Z8JwNlkZYosBtBOKeCe
 LKgFOTBSsfsEWOvXigGnNTluUPIV7fL0NELASH0Hepm2qo/Ux5LNcugSLFsryc0lFWmpMcXsUja
 Q5dzCh1wR5XpioA==
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
 drivers/clk/samsung/clk-exynosautov920.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynosautov920.c b/drivers/clk/samsung/clk-exynosautov920.c
index 2a8bfd5d9abc8acced4e5a3eaacefe5fa724cbd2..e0ba75fd20177022dc7f461af5968c154b6a8a37 100644
--- a/drivers/clk/samsung/clk-exynosautov920.c
+++ b/drivers/clk/samsung/clk-exynosautov920.c
@@ -1447,17 +1447,16 @@ static const struct of_device_id exynosautov920_cmu_of_match[] = {
 	{ }
 };
 
-static struct platform_driver exynosautov920_cmu_driver __refdata = {
+static struct platform_driver exynosautov920_cmu_driver __initdata = {
 	.driver = {
 		.name = "exynosautov920-cmu",
 		.of_match_table = exynosautov920_cmu_of_match,
 		.suppress_bind_attrs = true,
 	},
-	.probe = exynosautov920_cmu_probe,
 };
 
 static int __init exynosautov920_cmu_init(void)
 {
-	return platform_driver_register(&exynosautov920_cmu_driver);
+	return platform_driver_probe(&exynosautov920_cmu_driver, exynosautov920_cmu_probe);
 }
-core_initcall(exynosautov920_cmu_init);
+subsys_initcall(exynosautov920_cmu_init);

-- 
2.43.0


