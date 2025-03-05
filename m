Return-Path: <linux-clk+bounces-19012-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E05A50E0A
	for <lists+linux-clk@lfdr.de>; Wed,  5 Mar 2025 22:46:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8576D7A823B
	for <lists+linux-clk@lfdr.de>; Wed,  5 Mar 2025 21:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CFA92620C6;
	Wed,  5 Mar 2025 21:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I0g561Gt"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E700260393
	for <linux-clk@vger.kernel.org>; Wed,  5 Mar 2025 21:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741211069; cv=none; b=Ukkr8TqPpIH6xLtd+sFpxm24H+JZoD6NKDG+YvKBEBfDAYXv1VxGt+j08AyCe1EXKiXI8clBH05ionqZCzYu0JREQwpS1wxnLRY1GuNwwFkXJL8Gp09bn0tiRgiXS58EnDVDl7Vm/tXyd0oFIw9ZvJ7INcc9axrWSfMz8soOHf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741211069; c=relaxed/simple;
	bh=4eo93tsZ0/GxwIl5Nhb2FbHPag/3Lb/a4eLeV0239cU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ondTK/E1+FinhJywHpbdHg+LEOaMFD9HERwKj/bevdip9CJE/jVtPoznGqkQJTyvZ0bRYxMGeOlQW0BH8Gko6yEalLemQeqjv9kkE/IK7GxBQzygc0roRkSE6psZfmOs2GQybu6m7W9vNUhah7bEQV44tVSDXKdLMixUrD8yJHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I0g561Gt; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4394944f161so8937445e9.3
        for <linux-clk@vger.kernel.org>; Wed, 05 Mar 2025 13:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741211065; x=1741815865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IZSjThyZHhdWGlYf2wRahOUbPzc+0Bbe9Htg664cFk4=;
        b=I0g561Gt2Ita4QT7oJq2r6ZFCPiq5jPYSnXkhoPqjyL2AIJBmplh7kmMzHAdY/Ipwi
         BhUjL+r59aQjre3FX3TGV4gvkp8kqDQ4rme6Zj+FT8iw2FQU39iXPhMDzHE/wtIofGwt
         3JeOSYb/RJfe6ComO+g/mUmNNflUIz+3ktBd1tecSNw6nKUsRNCG6uXp9a1P8NKt9og3
         IVSQncKXHJAjDUAEEMnfvLjPwVz2FejjjFdcpDFFaSW1U5nE7da9sKpuPlR0rdqH0HPn
         Eg0fvTNbLbjPlBO1CqTyk7YzuhB0+4OSpnPOGIOfSYhDnfaJYy5hVbgpuX3i3L5V1SeF
         DXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741211065; x=1741815865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IZSjThyZHhdWGlYf2wRahOUbPzc+0Bbe9Htg664cFk4=;
        b=je6TSVcz4/qu/dtA7kdiSBcXqki10y0EwX5AXPt6tGwUZjpl5mSm0EPAYznlYkvG+W
         WdyUvJ9El4w8ozOe/hGLHHZ+qh1Yi+ZDN/53cJioxb6Q7dVyh1x+G4KFEuXNQHr8hRYg
         Cv9QNH99NRT8OdyfEVdzIwKh9AL/+U28DpBTtcn+JcxD/QLL9Xdft9k8hE38peCM+osc
         op2obAtGCGSWYdJd/mchM9uIZpoOYbGLmvlGBcQoCeLSkFVFOB1b6eAQ5LzDI78jq6xF
         npKmb7llVt1nJpTd3lXVMi1hqX2v8qPJ7ffYS4vW8FfmuEdaO78fbVDOsHTT8dgDVfB8
         goig==
X-Forwarded-Encrypted: i=1; AJvYcCX2r36sMWdqtoFlIPj0tHO4Z5vt53mFqRPs2XFcuj5Oz1/Px70eu7JjpCs5yDCbOrIimnWqz+xwiWk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiMN4nT3Tyd49meDzy+8QjUXAAvNNlvmCEzwGLvdMN5Eed93J+
	3WoNHhNdmspejaJEzBk5laBbOgSMNTSc0PvixSnZmijqq51PzoBBFIleSyvQlItAmAUBsx3vHwq
	7sB0=
X-Gm-Gg: ASbGncsjgsXkthHrRsDEzQvcbiJHJ9QK7gnQJDG5YejW27hJqyk4vp0AG5g1St4MM4w
	TkN6YYVikyF72kM9gue+FK3ju0gEaHSXdMi15l5aDTkh6YPKL91LVEfHORySqZZe1o7djXBl+tc
	eyY+Y1LF9YJm1qjceqc9iq16ZMfZsHnKuy65+0jkZpI9AcrRaux8Ds/B57PDWld1TAb9SccUq/R
	kwd7eCyyBx5mnx9I9tUZBIhqI2hWK8ocQz49XUphSjWuBLbzhhQjRGrtit2bHnKPZw+ohAweAcY
	2Cry/VPCAVdO5gYVp7HHcwU30iKrztzr+tQPT0hguSKgKoYFo2aANmu3RfsA
X-Google-Smtp-Source: AGHT+IG9oDEbjWb5CHLFd4pvqc3zsjvr7YXKlBgukhSG7DD0dtCAa5qeb4IWgIRHQyUrKQp/E80hsA==
X-Received: by 2002:a5d:64cf:0:b0:38e:48a6:280f with SMTP id ffacd0b85a97d-3911f7ae2e4mr1607807f8f.9.1741211065124;
        Wed, 05 Mar 2025 13:44:25 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796517sm21954802f8f.5.2025.03.05.13.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 13:44:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 05 Mar 2025 22:43:44 +0100
Subject: [PATCH RFC/RFT 09/12] clk: samsung: exynosautov9: Use
 platform_driver_probe() to avoid __refdata
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-clk-samsung-ref-init-data-v1-9-a4e03a019306@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1515;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=4eo93tsZ0/GxwIl5Nhb2FbHPag/3Lb/a4eLeV0239cU=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGfIxZ6hH8H4OVVzPjscb/kQnFA0nYBLz6OlbJrPwAPZTR0mW
 IkCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJnyMWeAAoJEME3ZuaGi4PX1qEP/i8J
 906a4b7eLT78KedQQmJMTOfPgdXyHd49Q9w9IfrsXvcdJBs76T4161HaWoJG7HPC21WLVr+E+QN
 2jXbKQVbwE+y6AEoKemy+7NoxBfajrVUuMunNpMbQhFoLG2e3Gy+gTCWu72MN/5h0PqUekel47W
 vTvWxCIu5IUbrXN1c0eqU9yjPbo5p2zCQNmjMJELs+Dh3Ybjs8kueVKlr9kGmB3TEkE4/AsCp0O
 Evka9WhRh3B7SBGd5kD7yZMwNl0nqrmzilg3s/DoX7+hdvVkJwP+IthzN3Diktbrk4TsKVjBwU7
 kVxWVoT88D5ZO0CyGmykfA0KHdlIREpJS+UiPH67ZP9m5oIAGlfyTF3pkkPCo34nz+Wu+dXzA5Z
 YDNbSmtaKW+zIHRASAa0GyzhhFXx1LcN6YsDucmvwKnA8sfAwVT2jZ5uJXBn1NnqIMVhXk1xvvV
 7ssMaWC6HLnzVqkOHBCJx+ElQrxyfRjcmHW+W2JPsClUGcRsroTAlZq8rw9KEUU03SgOW0HMaLt
 FwukRkiDshRpksvnA4467ZAFGm368u8/8X1b0CRh6/yWzXY0JquFTiMW6+7eHgAcPhTlYTgyhfJ
 fbl3N7yGvIiZlZNkDeeeo4+6sA6BCEWguPh1Z//xwm4A1zmJ+KSTqo/EjKuxWxxUr7vr0k131hq
 qor1/
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
 drivers/clk/samsung/clk-exynosautov9.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynosautov9.c b/drivers/clk/samsung/clk-exynosautov9.c
index 5971e680e566336ecdf55bdccacc3cea09a33201..627f3d2666740fc4cba205e6e2da65f53b8df186 100644
--- a/drivers/clk/samsung/clk-exynosautov9.c
+++ b/drivers/clk/samsung/clk-exynosautov9.c
@@ -2190,17 +2190,16 @@ static const struct of_device_id exynosautov9_cmu_of_match[] = {
 	},
 };
 
-static struct platform_driver exynosautov9_cmu_driver __refdata = {
+static struct platform_driver exynosautov9_cmu_driver __initdata = {
 	.driver = {
 		.name = "exynosautov9-cmu",
 		.of_match_table = exynosautov9_cmu_of_match,
 		.suppress_bind_attrs = true,
 	},
-	.probe = exynosautov9_cmu_probe,
 };
 
 static int __init exynosautov9_cmu_init(void)
 {
-	return platform_driver_register(&exynosautov9_cmu_driver);
+	return platform_driver_probe(&exynosautov9_cmu_driver, exynosautov9_cmu_probe);
 }
 core_initcall(exynosautov9_cmu_init);

-- 
2.43.0


