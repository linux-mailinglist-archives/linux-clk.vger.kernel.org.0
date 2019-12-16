Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 022BA12012F
	for <lists+linux-clk@lfdr.de>; Mon, 16 Dec 2019 10:30:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbfLPJaV (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 16 Dec 2019 04:30:21 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43471 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726992AbfLPJaT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 Dec 2019 04:30:19 -0500
Received: by mail-wr1-f68.google.com with SMTP id d16so6327247wre.10
        for <linux-clk@vger.kernel.org>; Mon, 16 Dec 2019 01:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=Qa3rJnhJbTcROjMKp121dlZfgwfeX0Vh5JSjU4DOTw4=;
        b=ucY3lk6kSKWb8WI8WYYykhbuCjOXeHofj9fsa35CoZnZbnzTkKgxvFUwQWDWih9Yh/
         S3X48gi697HVj1p61iRLoLyIm8Jhgc2ByjKs7nimotgLP7PSDRP3qH0eJkwl290U+T/5
         i4tIW8nxv6bY/VEZd2lunf8iHrg22LjAd5C6iLUYfGzl2Yowgj1d6t3LNm++IZqZoAYx
         V4ZyAHz3y/KH2XTIW+8lIu+3gqo8jw327Qh/65fyhWJ9O2ht9o2efNhQkT4ZWYxFS64D
         u0H2S9H84GZa6s0JVOr0Ndrs66NbYGMWICVzxH1coajOWm5oHoJSb/0UYE/cipuoU9GK
         RsTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=Qa3rJnhJbTcROjMKp121dlZfgwfeX0Vh5JSjU4DOTw4=;
        b=PGgNdU0ht4a2EMxpSleEoQnItHSI3fF8IIt9Dgon5lqSMCqz06f+FTHwdwxQrhzfUh
         /2saddFOsk/YYyOKqElC8zQHaTuhL6zo+5Ans02kz/XXB/6rEQcpEJ+nuaVTF0Mo1p5c
         +58FeewgneVZ90WsoCq1BXtDsq+jXrUnzZBtjIh7v0HHzEjlGqIiW1ZOTZFEa34BHJd4
         jrFRD5OYoNmeRuJG8fh4vJtw6w0sV+/wTcbrtkRfwYoypI0PYqtUQUGGsZ2O1eKu9zlg
         jHJzYAPtUBzq80lPXCEv+gWEy5B7M+EcOIh2HUFgE6UynqmUL9UUsDA1ahTBXviVKR2B
         T6Uw==
X-Gm-Message-State: APjAAAVnHBCKMRN1wtVfVyLamppt8Q67xNRhMj6v78TknIKk2rXu4RjF
        FeCg27qFcRT+NvgqOv1AJ5zHJA==
X-Google-Smtp-Source: APXvYqw0Oq5EvD7tniwfOWliXttZ46sD5RoIB8+aIXMEBzjm4iXlYItK0hdJX7LShDNOWedUKQ+hfA==
X-Received: by 2002:a5d:6886:: with SMTP id h6mr28736169wru.154.1576488616925;
        Mon, 16 Dec 2019 01:30:16 -0800 (PST)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.gmail.com with ESMTPSA id s16sm20951366wrn.78.2019.12.16.01.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 01:30:16 -0800 (PST)
References: <20191213103304.12867-1-jbrunet@baylibre.com> <7h1rt89nuf.fsf@baylibre.com>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dmitry Shmidt <dimitrysh@google.com>
Subject: Re: [PATCH] clk: meson: g12a: fix missing uart2 in regmap table
In-reply-to: <7h1rt89nuf.fsf@baylibre.com>
Date:   Mon, 16 Dec 2019 10:30:15 +0100
Message-ID: <1jo8w8bot4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Fri 13 Dec 2019 at 17:44, Kevin Hilman <khilman@baylibre.com> wrote:

> Jerome Brunet <jbrunet@baylibre.com> writes:
>
>> UART2 peripheral is missing from the regmap fixup table of the g12a family
>> clock controller. As it is, any access to this clock would Oops, which is
>> not great.
>>
>> Add the clock to the table to fix the problem.
>>
>> Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
>> Reported-by: Dmitry Shmidt <dimitrysh@google.com>
>> Tested-by: Dmitry Shmidt <dimitrysh@google.com>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>
> Tested-by: Kevin Hilman <khilman@baylibre.com>

Applied for fixes
