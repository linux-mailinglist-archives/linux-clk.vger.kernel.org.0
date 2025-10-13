Return-Path: <linux-clk+bounces-28978-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EE4BD106F
	for <lists+linux-clk@lfdr.de>; Mon, 13 Oct 2025 03:02:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 02D674E320E
	for <lists+linux-clk@lfdr.de>; Mon, 13 Oct 2025 01:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C3C7213237;
	Mon, 13 Oct 2025 01:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="byjPXSG5"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FE61EB19B
	for <linux-clk@vger.kernel.org>; Mon, 13 Oct 2025 01:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760317306; cv=none; b=Ff/crlH2hjHpPQpwYGnR3htG5lz5/o1F0R3AYa00J4StdWGlOPhVBQtd0jH+DjESfr1DGKAkyvRUBu5xJTcWfUoXcPB6vu83lfZXFCEBkyUcMK/gEdlRgcQ3boHng+GgwRPs5wWmDjeVFjKAg8uMfX3+YNDMGPrcBHuOVfF8aOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760317306; c=relaxed/simple;
	bh=Q0pn8oeo+EcdQqzzyFQGfHXmr2LXraohVV8PKC0lDGU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oSvxjSCzRBMKFs3u0eWBO2pYmmr0YBxzQT4Y8peAcC23u4VjmtBZVrfvjkbaIDnqK0uyh8uvyS4SPc9lpCkKiOjrxzvKi7hDx/IInNNBLcn9rJB6VOM/KN9m+WbQC1hrdZq98ccDKAzFmQzIEIho33KVs840oIducJeEcvJ9ZFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=byjPXSG5; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b631a684a9fso259995a12.1
        for <linux-clk@vger.kernel.org>; Sun, 12 Oct 2025 18:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760317304; x=1760922104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CPXC6v/EI3bevjgCYFAPjzae6a+9JFnCELYN3lWtwW8=;
        b=byjPXSG5DmeyBXjGLF9BmBwYji18r8Y1BYQsWCY0sTULTGJbpnfsH1rXH30Wp8nARs
         AHrhVk9XZI+bYGIIJzaao3fljaYo8P19baeQVbkRGsfORD1evZNr4x/ssvjnEe0yT0Ig
         DC+1oDU5HWfmxJX62cQhJeq+4l+tpCRq/u7CF2HU3X1y0Y1vTIZcKUKmqAbX2MVxSyZn
         XO71bngpNP6ha9GcbJpzPZCou9rVklghvg7uFYbKQYTkuPsoe33CocP/QHBzISamkHNV
         sYAwQDMM13nO4WWT/0vWpneUnJ24yjtQM3+qYwXNbs8a1E/Un5WupzlyG1gY2uMHy141
         FPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760317304; x=1760922104;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CPXC6v/EI3bevjgCYFAPjzae6a+9JFnCELYN3lWtwW8=;
        b=iO4f76KZexjP8rNhJB8keuT3w2JZkQVDU//OPp+v9aYTov9P+M+1mRLsN6Gdlgok+X
         g/6lA+5FWUU4cAA4FvTsgoaUBxpscLunCmwyklBN+Z2nBTYK6nNV8vOHc+itlo+k7/L6
         HX8dESmAYd4rHipTLwSFO9Na9MlacHs0cUMMW1d8/vtKnFOXYSzD/VFgLT9pR5MgexUO
         8a+AitXVN+jCOoewz2HhYBHRKvOsDeyqwvaxm5edXesuSbcgFafsqUvBwNx0HtiMF/8j
         4Olt4dI6uk6j1IFjWrlVMPnWzikRcUDAgXkkQz5pKSuKp/98cPYGEOO087svJZ4gufw8
         ivLg==
X-Forwarded-Encrypted: i=1; AJvYcCUqu6ekXma7aDL3m2NlrmzUDFMMPXjgGsS4AQz3ZwBn34FlV/2BcJM7XwWPjf5z+tmTpkyJRiv+5YY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCeep/o9Whi9Q20Ii4/MRN+26UdKnLViBxDGX2kbOuLYFbNWFn
	5f+RrW84RMaAwQf+NCiXgyJ47bWP30ToTVzJcJ6zXy9MsJoEVcQqIsArxrDrR/zAb/Q=
X-Gm-Gg: ASbGncsM1e0dkoQknPdnPzCuita7XoCIrQ/zPi0Kocf2kddEcKAa+wDVLl43BiI9O3R
	Um5/6fH4K0XxvEfe0FQx844cQ/H0bS3Bn550esP+ykB8ugpjbp3Yu34qOQ8FMtV6Owt5Q9N+5dc
	Pum4G55ihVoxfAWmO5K3dQjMXOhBXoQBvMzrPvazIy3utVtID9FknUNOKpN2aGHRUm1tXMzFwwj
	oo68FpMyx3XSOc3/A8hTrjwvFV6suIxrY8Yno4TycymMHG5iTOlp2zw4+9Pf1OOC+49PsEayG7C
	I10DFVqN/Vuz97xMLzD03deSW3Fnj49tfePnsp0eFxsFinp46rCFzU/LyKNPlOClfCMULSdNSfI
	MV2K3OdofCg2hF5LRBfTLoxdRzdD7F6c0HaRnZPFBMM3j3EovIwFecp/CFo2v
X-Google-Smtp-Source: AGHT+IHGK6ykX0spOQKYWsRpuS2oCY34wte5d1qjAZUxv5DNXPyTnvUCU5Jclrwq6RaUGeZTRY3rkQ==
X-Received: by 2002:a05:6a00:cd1:b0:776:165d:e0df with SMTP id d2e1a72fcca58-793827947fdmr11943201b3a.0.1760317303940;
        Sun, 12 Oct 2025 18:01:43 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2ab3sm9512805b3a.64.2025.10.12.18.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 18:01:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
 alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, conor+dt@kernel.org, sunyeal.hong@samsung.com, 
 shin.son@samsung.com, Raghav Sharma <raghav.s@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, chandan.vn@samsung.com, 
 dev.tailor@samsung.com, karthik.sun@samsung.com
In-Reply-To: <20250915095401.3699849-3-raghav.s@samsung.com>
References: <20250915095401.3699849-1-raghav.s@samsung.com>
 <CGME20250915094515epcas5p3210f5c66a24a7a7f23a04075e7636a89@epcas5p3.samsung.com>
 <20250915095401.3699849-3-raghav.s@samsung.com>
Subject: Re: (subset) [PATCH v2 2/3] clk: samsung: exynosautov920: add
 clock support
Message-Id: <176031729821.32330.18319569352723802430.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 03:01:38 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 15 Sep 2025 15:24:00 +0530, Raghav Sharma wrote:
> Add support for CMU_M2M which provides clocks to M2M block, and
> register the required compatible and cmu_info for the same.
> 
> 

Applied, thanks!

[2/3] clk: samsung: exynosautov920: add clock support
      https://git.kernel.org/krzk/linux/c/ac5d829873c737edae220ee654e423d383163630

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


