Return-Path: <linux-clk+bounces-3422-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE3184DB05
	for <lists+linux-clk@lfdr.de>; Thu,  8 Feb 2024 09:08:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 392FA2868F8
	for <lists+linux-clk@lfdr.de>; Thu,  8 Feb 2024 08:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E866A00F;
	Thu,  8 Feb 2024 08:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Snm/2vgP"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFD469E1E
	for <linux-clk@vger.kernel.org>; Thu,  8 Feb 2024 08:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707379720; cv=none; b=rpZDvXHMcBmPo4aKYX/wHyjgt3zuKRJxnBel+Scb866JO1ttPTmkoVRbM3kU/feYVAaSyCacF20HWmUrZhWAUzuOqFnuhdkm7bZv6T/m4i3NTFGhLc79WDA1ZW9WkqUY3IPxLFB7G0tZlKyLwoi3SWx+TkWTCLL3W1L2QBHvlKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707379720; c=relaxed/simple;
	bh=3lATnbjFqUkPRP5rvW2lt/Xjl4kndhZzCQ8IHOIAdo8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pN1ahTF8vxL26k1LD8tBzIq+GKBF4AMNkp8fV2rm6s4JIcKoliOPV7xCPEqbS2PJKy24vGPyacTDTRbBCMdh+CWOrFAzXbNLLCT9I+0UHpan6cTk7fg2jIw19pMPuydrr1SBCnAKBsL2q9ChVQC60eB+wbnO7vpRS6o3m1G7Wkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Snm/2vgP; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40fb3b5893eso12140965e9.0
        for <linux-clk@vger.kernel.org>; Thu, 08 Feb 2024 00:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707379715; x=1707984515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rdp4dL3rM3flH7iQAF07gFUyq3zGGDvNF5ahJ9LnEow=;
        b=Snm/2vgPBXM/EsHH/VQDLb9ew7ZNAr6XIZr8Ltyj7CKhxpUCDgv9M4TB8xpbQgh/IF
         qm03I3vTn5E6SR/WfL4nq8Z6RycUwaOyQ24fWGqZfjnn73QXY4Gmm8xj5V9M1gNDRPD+
         jJ86lwMgOdZafQR9LGc4eRKIpwScZyjrbZ7NJo9uxHGUgLez2ISpGnbuvzrHgQEDQ7Es
         1BqVFby1nW4mzp5V3DSDOed8gmkPGnUAtckki6uC0Az72vbxFkBR3416ndBzrIkMkgdP
         J/J20FEsBtsbuzWiKJNJlHUTiHeR+VM7R99ewzACE8yaduC6jdZ/TartW5djJ8Pp6RMi
         EHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707379715; x=1707984515;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rdp4dL3rM3flH7iQAF07gFUyq3zGGDvNF5ahJ9LnEow=;
        b=TwkmFOOCrWn97RTbiFxDqnwpPrHpLyPMskjuiAsViStuCpIn3MP4PZXcNI4OOajyS7
         4L/kSk+DGyU0goiEM9/2OkVTrz6lenb7Jbq0LIGzzpL1ciNY8F/ejr1i8pPdzKfpVY8S
         ANHtkd8c5WjvfV4P58RBrRQIgfZrk4CHbaGps+3ch94xD5qcoA409nioOE+P0ZZIGS7y
         J+roge37Pr4iDmQw+ucWTatoCv0XSuUwEirSVN7Llt1BqIVWUjnflZAWDqJf6YxVdmQW
         4+P6kworUG4u0u7TYG2FVBI3Rv2lisq6qJA3XZaQl6rSoKRvNNvx3I/QaF1wLLw04b/i
         cCoQ==
X-Gm-Message-State: AOJu0YxVQ8lZsweR1UvVKBPLXt8Nx9a1ZbyUtaYnT/Kd+nmHT+fOBpid
	JLmielaEIDUFGRVmXM4TvLb3T9cM1N7YtDDXxjNjts0tQRhum64OtqiHlxu89lM=
X-Google-Smtp-Source: AGHT+IHXt3SObg8KFi5GbsvglmKCYlYBALjaA6P5g3edgwh4go5MvVQ+edJSWJgPjnlOqJvh4jhhFA==
X-Received: by 2002:a05:600c:5612:b0:40f:d3b3:b6d2 with SMTP id jr18-20020a05600c561200b0040fd3b3b6d2mr6198087wmb.14.1707379715587;
        Thu, 08 Feb 2024 00:08:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUQoxTcTMXUQRX+je/okcgrpGiOuCBL1i71cndp00Z2R5kFfP+mDRUuOJpiXEmN9mDXpGF/O8KpSW0hzYU476UVpokTByGwS5jGgDHjxI7VFhSApL3cxhJ3bgcjFWpugY+b4clf2EqPALu1fxtpTxs0F+M2pBm6uEwT66VmjLRs2erqq92SGL3U40Du1z9VVIwyXkmA8M62zBDOz8M1vpROYrsfSih70v7nztPgaTftGRLcfG/AAHqZ23g8Zsce9cHBBDaUQJge4OhfQhVlLYu4WwqaUYo8UCybIez9Ca5r6xpq7QcS4V4pAnj5VUz7EGp9DH6QybxIR4UMqciCV516bK2uAHtE0Zyt1BubV00XUx4kR3iHlMyppcgK8kzrnTRhp78RvsfmDs0KYew2lFxnDZ7ERU2e+tphdeM/r5OhG8y2arLfBc+RWC2lEcl0KYstiom4C+K1pc3Q7apj2/u0usYgat4M5o7dpy+Ryh/+YVC8O43N6xomPy+/hruhHkCz5jbS3c8ITDyfbvna4vOfIPKjUhTuetwoHGpN4NG2lgVkDwZpHlGDKJGvg4q4xDzHdLjGN1OiyXal+ux+en9fChiL8nvD0yAdfM/Cx58MDotlDAU2OdDYRyBCHISdhOSgkSO4R8Jjd+VCzG8rr0NXt2SciCTzpvIsjfEdfGRMf4L6Hrs3Pw==
Received: from [127.0.1.1] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id m3-20020a056000024300b0033b2799815csm3065421wrz.86.2024.02.08.00.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 00:08:32 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com, 
 tudor.ambarus@linaro.org, willmcvicker@google.com, 
 semen.protsenko@linaro.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com, 
 tomasz.figa@gmail.com, cw00.choi@samsung.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20240201161258.1013664-6-andre.draszik@linaro.org>
References: <20240201161258.1013664-1-andre.draszik@linaro.org>
 <20240201161258.1013664-6-andre.draszik@linaro.org>
Subject: Re: (subset) [PATCH v3 5/7] arm64: dts: exynos: gs101: enable
 cmu-peric1 clock controller
Message-Id: <170737970922.52344.8745596407204525515.b4-ty@linaro.org>
Date: Thu, 08 Feb 2024 09:08:29 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4


On Thu, 01 Feb 2024 16:11:41 +0000, André Draszik wrote:
> Enable the cmu-peric1 clock controller. It feeds additional USI, I3C
> and PWM interfaces / busses.
> 
> Note that &sysreg_peric1 needs a clock to be able to access its
> registers and now that Linux knows about this clock, we need to add it
> in this commit as well so as to keep &sysreg_peric1 working, so that
> the clock can be enabled as and when needed.
> 
> [...]

Applied, thanks!

[5/7] arm64: dts: exynos: gs101: enable cmu-peric1 clock controller
      https://git.kernel.org/krzk/linux/c/7d66d98b5bf376a999df13c65bbc0aac3cc9de02

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


