Return-Path: <linux-clk+bounces-5227-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F4B892E35
	for <lists+linux-clk@lfdr.de>; Sun, 31 Mar 2024 03:36:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8E611C20A8B
	for <lists+linux-clk@lfdr.de>; Sun, 31 Mar 2024 01:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AD9263C;
	Sun, 31 Mar 2024 01:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pHKamGTk"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46BB10E6
	for <linux-clk@vger.kernel.org>; Sun, 31 Mar 2024 01:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711849009; cv=none; b=r8JQE6rtraoCppdKHLId8q8soSXeOPIqhfzKlQ28noA0iua5CtzjDpBxhuAinWtWYQwZ3ajQFPvxyf1gGwMVbsz3kD6FnxiCe9yNVPTF0a1HxVSvMfv/ZmhqClFtFThE5zCosr8PWtXsoGiUcQWJHaiMXCmsTp1vi1ASsYOlUS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711849009; c=relaxed/simple;
	bh=EXKQs2yHznRuQNdL5NyjxdibUS87VDcxqibYqOefYFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mfJw5ABMXjyuobhW3eONJ2ZaQmCqKFO3Bs4I2/MN9TcL0YBtpubcklt0O8JD7c5yES2s/PWJiA8pIDpCoWI3XhGp5G+/wF0ix3LkkUw9r8pEuAoYTzTj5zVr5umSr4XsP7x8FTgl8B3Dwqjx7yG7j3epBp7qWjG31zXo70PLqpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pHKamGTk; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dd045349d42so2693561276.2
        for <linux-clk@vger.kernel.org>; Sat, 30 Mar 2024 18:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711849007; x=1712453807; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4dFkRVydPkaE015eU5BNJh990ZNi0Lf5ZRU1eS0SWY0=;
        b=pHKamGTkFPGBAu5+CBVZ49MUJGvVOC1bv2R5ubBXmmCwbuD1tgNUTmK2n9SOBlqpal
         VfhXGG7oe+k9+JqVQEm0/tP6gUhEy7r93dPH85ISkHeMBbx1+X2MOm7dxH1Te8YgCkdk
         ZaGrYgrBwuGVs0P9HVmIcULBk0K/iRL79VF8PxQadUI/QwwP0gNW8pn0zGjjx28Siw4J
         1t/CFaTxQl2gCqezj1HInIgu9EI1le86oyeSgPwYV7UdeuiYF+U/X9RSIF2DRi/26nOy
         iAYYbpZLqV1LcnZz0PD9SOzt0Xc22n99Fh+NePuOCpvr/Hftt7f5ibqhBmGXk3GYiAYn
         +qyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711849007; x=1712453807;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4dFkRVydPkaE015eU5BNJh990ZNi0Lf5ZRU1eS0SWY0=;
        b=d+YVWLNuc/IEjtbDHMZgqaKAhXj5qjxrR8ZXUeTHgLL7d346fELlTL2dm2HqWhjIbp
         /zmS9t6sJ/zKwY66fXb5g6zO+8s/fte1fMt3MNdhLr/wzINly1rnabiGAvZm6B+JjFWg
         wx9XDSg/B7d8/QUM/OH1gayqTGo2Jg54u1a+MJo4ikXMAOFmuDltw5VNnFX+yJLWgXE6
         s7sPMGong/hNMdwkkjXQHS7kyhER6ROSEOBDbV6wqA0qND2SsxOMaN93VeQggH5f2y9S
         HOpxeCFVW30rDe1ajEUNI8XXLa1vwsPclqDwTfRLOTWdqiHTU7pzu8WIgUrVTS7MH4ju
         R6vQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGWwwMDWFfd5J1WZ47V+Ru8a4VmZtBC0dI7h7tzsANKM1wwqAExxjNADH7gooBoOg+aMIXiGqwZPlv03JldRQFAOEHNKEr0V+U
X-Gm-Message-State: AOJu0Yw2CAfiGUNr8HsbcQkN6KOesjEC8F3sP4QXe7+1qNsBLZdkWEtn
	wExoCCrwfC+YhoqYu4x8qFPftPV+cS/QQT5AhGkEy7zKGG0Ho6Ot+oQvM3N+HnrXOPqXJ48X1Kv
	+QlLgWb0PIB+Wlwexfn/0tkZ0JcmxM1Cq+xga+Q==
X-Google-Smtp-Source: AGHT+IHAjPkSd3yfAE7NxKWJXWx1xvCt643u6rPv6idQACrkemOcNCuSb2gCAYq8f+RLRMwcZpBCFbJctjz3VUfO1z0=
X-Received: by 2002:a5b:f82:0:b0:dc6:b617:a28c with SMTP id
 q2-20020a5b0f82000000b00dc6b617a28cmr5201001ybh.5.1711849006870; Sat, 30 Mar
 2024 18:36:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240330182817.3272224-1-quic_ajipan@quicinc.com> <20240330182817.3272224-6-quic_ajipan@quicinc.com>
In-Reply-To: <20240330182817.3272224-6-quic_ajipan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Mar 2024 04:36:35 +0300
Message-ID: <CAA8EJpo+RDowyrrAWMAzotdZFZwjZU77Rsb3tX__V0qLPU22Cw@mail.gmail.com>
Subject: Re: [PATCH 5/7] clk: qcom: Add CAMCC driver support for SM4450
To: Ajit Pandey <quic_ajipan@quicinc.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Taniya Das <quic_tdas@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 30 Mar 2024 at 20:30, Ajit Pandey <quic_ajipan@quicinc.com> wrote:
>
> Add Camera Clock Controller (CAMCC) support for SM4450 platform.
>
> Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
> ---
>  drivers/clk/qcom/Kconfig        |    8 +
>  drivers/clk/qcom/Makefile       |    1 +
>  drivers/clk/qcom/camcc-sm4450.c | 1688 +++++++++++++++++++++++++++++++
>  3 files changed, 1697 insertions(+)
>  create mode 100644 drivers/clk/qcom/camcc-sm4450.c

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

