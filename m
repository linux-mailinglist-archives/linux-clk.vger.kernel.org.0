Return-Path: <linux-clk+bounces-19940-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FD7A74AD6
	for <lists+linux-clk@lfdr.de>; Fri, 28 Mar 2025 14:40:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 800BF189E7C5
	for <lists+linux-clk@lfdr.de>; Fri, 28 Mar 2025 13:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16638214A70;
	Fri, 28 Mar 2025 13:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="udZ7EYqk"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8450194A44
	for <linux-clk@vger.kernel.org>; Fri, 28 Mar 2025 13:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168660; cv=none; b=kkLHZNJKEZUnFRpLTUZfRlQ3BxjXaK/MVe+U3SkrT1UjbShZ9o8UJPzYoShBT8u5kKoPJMO1+IrJmHxzRMThK8mwDCxTIUZKUsjtNlEj3lsS97qWuHDLyxoU6gvd8nz2T98j82hi/1lt0bCQ3ZixMCyb3Y+sPl878o+VjnqngyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168660; c=relaxed/simple;
	bh=rtY22MgptB+tLy3QVxclIgluL35Op8OhX0cRjsl/mJo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QNS/RvdM6WIX98xcDv5AABTl8RCeyNjMVZzqgYr9ZsoKtRnDUP33mr1UinxKGIf5OT0ryqOKpp3aZ2Ind5+9UIDGRZuC4aKDNEq1be7G59W3KlJH2yWNXwtitJ020rumixdEpXNWTTeqZNbELNcdlvvcIXRo01cGmqUD9eR7EwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=udZ7EYqk; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so4131779a12.1
        for <linux-clk@vger.kernel.org>; Fri, 28 Mar 2025 06:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168656; x=1743773456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eMxQ7UQKMt0+Oaxy9pEE80XpNTXV7CL+WPCOZ4uzjjQ=;
        b=udZ7EYqkiqCuXbSiRXCMBZmiDe3QWEWva5a3Tl21XVIONFFX3Ga/CUAOfR4oJNO7Fa
         7wvSQQEP23kKdZ+CiLQncc0Gfz7pFq5bpayn9fMgltnzJutksKItUmRbte5hGgJcLA42
         JP/Jp4ERedHbLVmXjXBUgKWzIDu3LWlVxfJnaKxhNrwn/2Lyiu3my9hjnXrkNawzJVrs
         AbT2qJ59MzOKV/fKVGYE6k9fnCN1Om0tsjVSXQcGff3YJS/oU/8brGL1vuPFAx/hQm0i
         b6BKdcme94J24CtPFbz2DioFe4X0kmvZyfxH7HbhsRvhNXAE7RK/Tnar73n0lyB1L2+h
         q1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168656; x=1743773456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMxQ7UQKMt0+Oaxy9pEE80XpNTXV7CL+WPCOZ4uzjjQ=;
        b=Ts/kpBCdUj/SyWs2k90SWFnF2QSEmAoIgQ/Fn9fuiwBmjQg9WgQPsE8c0LGy3WT2ap
         nndFOvbAXUZZOobRBLMy+XgHTB8c5O4Lv4/aNpJgyWJDFKkK1Sbn+rrUIPiUwMr12Y8E
         r0Qhhy6tXfx4ISElclRfDXSOV/KOBhhtR1YutrbWPwLKZxnNnP3E7SrrOfR15e4NGMD/
         cNF/Mdxj6RFlrtVRNHdSA6/Ko0o6pJ/Kd1CaHWm3nne1YQ9/9L74ubtFY5iUjAZ2vahB
         h/Bey0mqbSClWTxquhX4IqToIF74npidmBAELYxNnYFvhSZHlcZVkzmDyQ0xYLUEKSLs
         xsgA==
X-Forwarded-Encrypted: i=1; AJvYcCWKfwBWV1eIvIkNGmDPAawxC0/BH3S5SVvzFetRmw0YKkYVcIcGjImAs+4sIFJ1q95fW9RxyWjzv/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfyJpen45zteOKuIiV8e40fZbcHXP+ofDUFftH88sEwxsNcqcJ
	uKHSeEGLmpkIPNEmxnfG3tQ/8gUtSX8tonhbobnbC43MsVBOVpPyRH3vO/ePmWY=
X-Gm-Gg: ASbGnctrndPGhD3XXUqViYBctPJ+R1+vmdIJnuHtoFsRWwUTt4Ody1tOMIDBnGwjola
	R5i+E73ueZf4I8GAcu4uNzhS2Qjn2uzETTlxtzgs6PF00LfhOvARFXsey71SmBtdwVJPGxWtE/Q
	hpPIVl8xD2oaSCyoDs5tXinMZG+Y5w8dLYBuPgtXvSa3VAxrt+OpCq6VKxT2gqt0oTyY+DEteBD
	Ml1ip0dkKd7csEoC84HzROAiXl8xMTULBRlKU2LEKT3AGZNL/lIWvQrd/d4/7u6Y8iwTwsH0lAl
	rvLD0huvH81eqnGA85CJGOXreSL3C1e+8QGEBTlitytFVCkT13ZDkWtuGQ7C52lQNvD8VI0iEQB
	RAb6Qdg6WXlHpo998IgJzO9vM2Y8eEPuRP1J9v4U=
X-Google-Smtp-Source: AGHT+IH35FaKYo+gSI6anwiHIjdD3ef6MXj/ihpM/TgWINmZ8ShobAVb92+tkqSJyQ+wsMpl6rBS1A==
X-Received: by 2002:a05:6402:51ca:b0:5e0:82a0:50ab with SMTP id 4fb4d7f45d1cf-5ed8f9027ffmr7884197a12.27.1743168655554;
        Fri, 28 Mar 2025 06:30:55 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:30:55 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:28:50 +0000
Subject: [PATCH v2 04/32] mfd: sec: drop non-existing forward declarations
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-4-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

sec_irq_resume() was removed in commit 6445b84abf91 ("mfd: Add s2mps11
irq driver") and sec_irq_exit() in commit 3dc6f4aaafbe ("mfd: sec: Use
devm_mfd_add_devices and devm_regmap_add_irq_chip") while the
prototypes were left. They should be removed.

Do so.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 include/linux/mfd/samsung/core.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index f35314458fd22e43fa13034439406bea17a155c9..b7008b50392ab857751b89e0a05d2c27f6306906 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -72,8 +72,6 @@ struct sec_pmic_dev {
 };
 
 int sec_irq_init(struct sec_pmic_dev *sec_pmic);
-void sec_irq_exit(struct sec_pmic_dev *sec_pmic);
-int sec_irq_resume(struct sec_pmic_dev *sec_pmic);
 
 struct sec_platform_data {
 	struct sec_regulator_data	*regulators;

-- 
2.49.0.472.ge94155a9ec-goog


