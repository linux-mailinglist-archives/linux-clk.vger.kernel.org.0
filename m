Return-Path: <linux-clk+bounces-7331-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB388D1C44
	for <lists+linux-clk@lfdr.de>; Tue, 28 May 2024 15:14:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 253191F221CD
	for <lists+linux-clk@lfdr.de>; Tue, 28 May 2024 13:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3262B16DED4;
	Tue, 28 May 2024 13:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wcSp2+pt"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD6B140E37
	for <linux-clk@vger.kernel.org>; Tue, 28 May 2024 13:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716902092; cv=none; b=HQtfkEJahUjJNgUCo1IcSMDNHeiHFq+ZHcUoi7oP70Dx2DkiEhnfLBhAa7lSL070z5eVBqqbtuaDkS9v871KmC5FIFk/VcvrM5tJbP5ifSJmq77x+eLkg0LbPwruKmahJ+UBGlQLiXgaQpIOPImbR8YiTvVxU2rr6N6HmMpAItI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716902092; c=relaxed/simple;
	bh=SeWXVvF22D9ZJf9IgluXoTCpCnkYe9ToAThBJHwIzY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U26kfyNsygcD7NEQT/Hvm87KehiRkb7F/Hs0Mi41PtKA9vdZimQzuBgRnSaxjw3ZklHq9yWmac0f427wIUvbqFKW0zIekYRaKTk/haLB6t98fArjVI9QJdhzB6AB/1p8LujCqPcKfnW5fXLusnvW5NxYmI/5HX6MTT/5jZUyUnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wcSp2+pt; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5296935252dso947665e87.3
        for <linux-clk@vger.kernel.org>; Tue, 28 May 2024 06:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716902089; x=1717506889; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6gaAjPPNW+1o8Nq5Xk3MdnoecgKTcrll+0FrMoJS3ho=;
        b=wcSp2+ptffLfjHTyNtjcjZc/W5nZ1N+1skE5toYnRLFsi47xpXEeC7knoKy6CGiPUH
         klgx1HHIWUByaYtdggLq+ixvYdK0Eds6/n9E+hK5QRgmmqcMbF5GRpR0pV4QRYjj3xLJ
         itMaD1Tuo/Y9HTbhNn5Q3k0bqKVej6MSEu/uwEV4mKhpBMlBtDBhhYJe1Tooq/JCR9uj
         /PAHCPUrJGCgw+9BWjFc38wYZGjS24iXdTGwYy/BDPHzewfBZahRnIDkoyG5OGq627J0
         TkxXP0oXeoour2671cnQlvEuzw4w/BEmb4YOm5XhlShXWpJN/1qODfMmzqF/XBymMOHY
         FqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716902089; x=1717506889;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gaAjPPNW+1o8Nq5Xk3MdnoecgKTcrll+0FrMoJS3ho=;
        b=HcUWQjKiw5DcWLc1mBNyf0z0BhB2DkSuun5YoBRKr7SyfEER0VTmCEASxLVR2iAw6x
         B5ied5Soeyz7kZEFbJtIe0S+30S45VkAYzCxpLMVSwWY4+kJ8VsxWgJybWqvpI6+1vAi
         7UH90RqbtQDpPeifGXF2R81gHsr3gayz/oFwHPHjK4lSbesU1uOukPA/OtYf6hvmIr2P
         pZTcDh6erqif4JCM0QcPnJ38VR0P5Ozn1fXAwSdMgigRLKP7KDuxH4vxVDa9ME1yUqAD
         fa7iu8WWVzhGqkQEpb6cQ0PWxdHWD61hQ6M8Ybgcaf+lN9uGZMkYV4Rg1poYL595bH11
         mpSw==
X-Forwarded-Encrypted: i=1; AJvYcCVatB36nOOBXGCyiv4mNPd43JWnVKZgj8OK3UlJAy+/0QEcKsUPNADr7euPjDNSq6emxQksu56HMBlJ0jQo3tWrT6FnuJuDHjk5
X-Gm-Message-State: AOJu0YyLzJAHW9bBwtBn/Of9jQKu/oLxzhoeImr8gDzDXKAvgDKw+KSW
	vdX+jXhWTnUyHTvB8J9xZUsMmapX3z4Avn4LVbgXqy4HvSrxHg0RWVb6RbvzxtA=
X-Google-Smtp-Source: AGHT+IECgbuCJq5CH9I+wOKcyKpG4gk5FMiLo2gVoFRgQ/xpYXkdBwseE2GUt86zkny6KhanGzA4zg==
X-Received: by 2002:a05:6512:2017:b0:520:dc1c:3c5d with SMTP id 2adb3069b0e04-529668c9cc9mr6763082e87.42.1716902088640;
        Tue, 28 May 2024 06:14:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-529b72ca748sm404584e87.285.2024.05.28.06.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 06:14:47 -0700 (PDT)
Date: Tue, 28 May 2024 16:14:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ajit Pandey <quic_ajipan@quicinc.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Subject: Re: [PATCH V3 0/8] clk: qcom: Add support for DISPCC, CAMCC and
 GPUCC on SM4450
Message-ID: <5ppxcqdtyn7a3tyaorzlxhaxhqtse5xvjpecppjcmbxodmsz3m@5kr7uacez7u4>
References: <20240528114254.3147988-1-quic_ajipan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528114254.3147988-1-quic_ajipan@quicinc.com>

On Tue, May 28, 2024 at 05:12:46PM +0530, Ajit Pandey wrote:
> This patch series add dt-bindings, driver and device tree support for DISPCC, CAMCC
> and GPUCC on QCOM SM4450 platform and also includes a fix related to LUCID EVO PLL
> config issue in clk-alpha-pll driver which is required for correct scaling of few
> supported frequencies in graphics clock controllers on SM4450.
> 
> Changes in V3:
> - [PATCH 1/8]: Updated commit tags order and added Reviewed-by: tags
> - [PATCH 3/8]: Fixed reusing of pll0_config and added Reviewed-by: tags 
> - [PATCH 6/8]: Updated commit text and added Reviewed-by tags
> - [PATCH 8/8]: Updated node order for gpucc.
> - Link to v2: https://lore.kernel.org/all/20240416182005.75422-1-quic_ajipan@quicinc.com/ 

Nit: in future please retain previous changelogs too.

> 
> Ajit Pandey (8):
>   clk: qcom: clk-alpha-pll: Fix CAL_L_VAL override for LUCID EVO PLL
>   dt-bindings: clock: qcom: add DISPCC clocks on SM4450
>   clk: qcom: Add DISPCC driver support for SM4450
>   dt-bindings: clock: qcom: add CAMCC clocks on SM4450
>   clk: qcom: Add CAMCC driver support for SM4450
>   dt-bindings: clock: qcom: add GPUCC clocks on SM4450
>   clk: qcom: Add GPUCC driver support for SM4450
>   arm64: dts: qcom: sm4450: add camera, display and gpu clock controller
> 
>  .../bindings/clock/qcom,sm4450-camcc.yaml     |   63 +
>  .../bindings/clock/qcom,sm4450-dispcc.yaml    |   71 +
>  .../bindings/clock/qcom,sm8450-gpucc.yaml     |    2 +
>  arch/arm64/boot/dts/qcom/sm4450.dtsi          |   38 +
>  drivers/clk/qcom/Kconfig                      |   27 +
>  drivers/clk/qcom/Makefile                     |    3 +
>  drivers/clk/qcom/camcc-sm4450.c               | 1688 +++++++++++++++++
>  drivers/clk/qcom/clk-alpha-pll.c              |    2 +-
>  drivers/clk/qcom/dispcc-sm4450.c              |  770 ++++++++
>  drivers/clk/qcom/gpucc-sm4450.c               |  805 ++++++++
>  include/dt-bindings/clock/qcom,sm4450-camcc.h |  106 ++
>  .../dt-bindings/clock/qcom,sm4450-dispcc.h    |   51 +
>  include/dt-bindings/clock/qcom,sm4450-gpucc.h |   62 +
>  13 files changed, 3687 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm4450-camcc.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm4450-dispcc.yaml
>  create mode 100644 drivers/clk/qcom/camcc-sm4450.c
>  create mode 100644 drivers/clk/qcom/dispcc-sm4450.c
>  create mode 100644 drivers/clk/qcom/gpucc-sm4450.c
>  create mode 100644 include/dt-bindings/clock/qcom,sm4450-camcc.h
>  create mode 100644 include/dt-bindings/clock/qcom,sm4450-dispcc.h
>  create mode 100644 include/dt-bindings/clock/qcom,sm4450-gpucc.h
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

