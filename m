Return-Path: <linux-clk+bounces-5305-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABD28950BC
	for <lists+linux-clk@lfdr.de>; Tue,  2 Apr 2024 12:49:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A4C71C23118
	for <lists+linux-clk@lfdr.de>; Tue,  2 Apr 2024 10:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EE4B5FDD3;
	Tue,  2 Apr 2024 10:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fyr3C/ng"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432E3657B5
	for <linux-clk@vger.kernel.org>; Tue,  2 Apr 2024 10:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712054941; cv=none; b=BILPLi+4+Yihz2+HGXz34kqMZZeFwl7BqdTH3vIOL26FhLSrkq3Qwtga27+DFs605+EmqI6F9nJmevSPtPS0qAlUphosvF8PwMIfVtd0JnOZJCAxzKmkMJM7NFLbHPgiInyRQYVUzyuaygfaKZwQQ4uFND1dqA/1ckxrHOXzXe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712054941; c=relaxed/simple;
	bh=ntfWqHpmDy4DIMcm7CKN+FPSTquvhkckHhRW34UWCtc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mX2ysF122Rejyg+1zRs2FdcEg6QcnmAGqqW+HV060psWE+952YtzrdwSQPu1SPAkVW+heHSNfEKNus/2zp8B1igGKwbpfivtMk9oSPFwIYICul7BHNbOUiT0C0e475/7wdjU+65mpScuRYQB3X9HSxwQ20VWCROpiOSUYSJXlfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fyr3C/ng; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dc236729a2bso4629532276.0
        for <linux-clk@vger.kernel.org>; Tue, 02 Apr 2024 03:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712054939; x=1712659739; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cL+6rU031lCbn4rJijXxXCPdj92d+pFHGEV2AGXf59Q=;
        b=fyr3C/ngTM2VuxuFV12egZBfFLQ4AxVeiSt2FjHUuultNYQuRd3xWWLYOn9q3mU4J8
         d1MQ+NGV6jqVWtDUpV2oE6xP+c44ufRS4UoTiZLWZR5qGp/IfZ09oW99yQDJR4DOGDQw
         BgxV/At5a2wwkuBFn11ZDArQu68DcH+UHJpQe8H1gIUmsSlH/WLA1Q/p86qdMYFyhuH2
         C1XqLR1YND2h0M/ld0sTne9OwweQ4NjxxQnoupiYz0mBDmMLs3AJ4v+57FTDSSeA8dU1
         TU+Kv9kTi2nvbtaapvwsHUkC7iNHapr+LXW9ui80qroQUBdAofRDpMmZ72BqT8WxwbqN
         azeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712054939; x=1712659739;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cL+6rU031lCbn4rJijXxXCPdj92d+pFHGEV2AGXf59Q=;
        b=OMU10i1z2GQL6U9XW8yl0QsavkbuoZaixmLBkHIOBuLbJzf7TNqp8hIP9QyiuPybFd
         o1FEtxGiDzG2ZcWImBAsz/bAvBZqVcXN3tP2xQtmeYefZ0qfqTOjir9xg1FrtvHEBczc
         B2ThJZ2eG6Y58hlBKbUudHieQ6xdOCAZHlWGYVj896LPo/r5Wmom4CsBKReQbMbDsQpH
         l7FnGQAahZ00bwlC93gf0PdP3gIzsmeHYilir4OSE5dcjpsPSqqFq/3zidACMiVytGVq
         PMW5Xr9QCMPGF4Ik9aGmsS5yl3w9oXjI8QqMtgPsMFugvAkpszShuDx769n1zzcPOm8m
         RSIA==
X-Forwarded-Encrypted: i=1; AJvYcCVMkzRjy1lh9SaOnMsOZEshlvr+QS5blaJJPjOzvRuTzb8ACK6FR2djqbwZhMz7W5xegVvu/0X5FA8TTA1jGFBR3yR+zoPbODO4
X-Gm-Message-State: AOJu0Ywz0oLtUoA8upQgvIho71K8Fhtso8f0mYCZFEcPZ0MZ9+ysH9Q8
	qQgZ39LtWaDF245vi0rIUi540+NLxGeRTLvxbm01KAiw/tRCrJHnVvdvV0TFwUlA08kU7EFhu0i
	7Ofei6Qel2TPE5H5cJTodOj+2Cj+8CzPPiXW02g==
X-Google-Smtp-Source: AGHT+IF3amTy3mi9gx0Fg8qpLFvR2VZ42wU7eSSjKWNzlxbLx8pQTgtu/c6DCvvde5oLRreiYm6VwKWGKN3tbIa8iIE=
X-Received: by 2002:a25:99c1:0:b0:dcd:aee6:fa9 with SMTP id
 q1-20020a2599c1000000b00dcdaee60fa9mr8752476ybo.53.1712054939333; Tue, 02 Apr
 2024 03:48:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240402103406.3638821-1-quic_varada@quicinc.com> <20240402103406.3638821-7-quic_varada@quicinc.com>
In-Reply-To: <20240402103406.3638821-7-quic_varada@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 2 Apr 2024 13:48:48 +0300
Message-ID: <CAA8EJpok9DzjSSt=ejegFo78zJqycs3S+bua76oXDivvzW7icg@mail.gmail.com>
Subject: Re: [PATCH v6 6/6] arm64: dts: qcom: ipq9574: Add icc provider
 ability to gcc
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, mturquette@baylibre.com, 
	sboyd@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, djakov@kernel.org, quic_anusha@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Apr 2024 at 13:34, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> IPQ SoCs dont involve RPM in managing NoC related clocks and
> there is no NoC scaling. Linux itself handles these clocks.
> However, these should not be exposed as just clocks and align
> with other Qualcomm SoCs that handle these clocks from a
> interconnect provider.
>
> Hence include icc provider capability to the gcc node so that
> peripherals can use the interconnect facility to enable these
> clocks.
>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

