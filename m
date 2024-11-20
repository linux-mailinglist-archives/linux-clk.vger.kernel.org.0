Return-Path: <linux-clk+bounces-14899-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 027F99D35D7
	for <lists+linux-clk@lfdr.de>; Wed, 20 Nov 2024 09:49:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBCDD283434
	for <lists+linux-clk@lfdr.de>; Wed, 20 Nov 2024 08:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE108176FB6;
	Wed, 20 Nov 2024 08:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n0R+QCbF"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88960166F07;
	Wed, 20 Nov 2024 08:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732092586; cv=none; b=lvEC4m/cbApYwN7HOObGzhwhgO3EtZybrEIMgJcO8syz/5/25t0sI2m/YVIuIaYFTK54+FBM0tdFdveqGuRBCfvQNv5XOV4fs3KKi17OstxAobnUXTs/526oJYH0Y4eQcMWtBZCv9vEfCFHp8r/1PrQh+knAmPZvJr5/buWjHZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732092586; c=relaxed/simple;
	bh=5nZJ8jH7+DbidD+XC+4urYQWbTdbZilWNFNwup3ilXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dxMRlvvWOE4WNDU9uxhV7VCh0QmTipjvX63znIZZqY4n9auEyRwS3zGSQ8ws3VmQpbtcB+wr2q1UbeoJgXMulIug3egsrVAGy7kZErLbwE4ARCgrnUQ09T/DrkPJF9fudcj2J5fi5td3EUvAGmNAumIzq7lpXaj8Nvbsu2sGxMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n0R+QCbF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 564FBC4CECD;
	Wed, 20 Nov 2024 08:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732092586;
	bh=5nZJ8jH7+DbidD+XC+4urYQWbTdbZilWNFNwup3ilXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n0R+QCbFtmZmFNiUpkIHzsMaP5bLUG/dv1aRZ13UDXwyRGbr+WW2LB92wqt5ku6ZF
	 /5PjWCPWEKHKIZhads5UFWBYDlSebMO6mhtf9EncySwGxXWuGlmwLJsB3GejAvtJL4
	 TQfaI+xxRBODmM2/cBeYHCSOU5oXoPmVsocrNX548a8jPqMSesdUYXccTjY2I8O2hj
	 UV1xay+2+3Rru8so+S689OzJy8+e9zY9eJpup1XlYmr0W4fyINGCkFH5ZMvgZ6EUBY
	 7AaEgoTkUWHQP3ABpFw3OBD4I1qdyYfAVtvmbbEql5c+B4GYYjZn0SHfP9aJmYWC4/
	 1MLzCqVuw9syA==
Date: Wed, 20 Nov 2024 09:49:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: i2c: qcom-cci: Document x1e80100
 compatible
Message-ID: <jfhd6fhp55dsahqajx375jitezsvscsbjfrbetpnzplsrq3ciu@5q2up7wbgp4y>
References: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org>
 <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-1-54075d75f654@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-1-54075d75f654@linaro.org>

On Tue, Nov 19, 2024 at 01:10:30PM +0000, Bryan O'Donoghue wrote:
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Missing commit msg. Checkpatch :)

>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Best regards,
Krzysztof


